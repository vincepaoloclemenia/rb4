class Admin::ClientsController < Admin::AdminBaseController
    before_action :return_login
    before_action :set_client, only: [:show, :edit, :update, :get_total_amount]
    before_action :set_subscription, only: [:get_subscription, :update_subscription]
    
    def index
        @subscribers = Client.subscribers.includes(:brands, :subscriptions)
        @unsubscribed_clients = Client.free_trials.includes(:brands, :subscriptions)
    end

    def show
        @subscription = @client.subscriptions.new
        @plan = Plan.find 2
    end

    def get_total_amount
        @plan = Plan.find(params[:plan_id].to_i)
		if @client.has_subscribed?
			branches_count = @client.branches.size
			selected_branches = params[:branches].to_i
			render json: { branch_count: "(#{selected_branches}) #{selected_branches > 1 ? 'branches' : 'branch' }", new_amount: @plan.amount * selected_branches, amount: (@plan.amount * (branches_count + selected_branches)).to_i, period: @plan.period }
		else
			render json: { amount: (@plan.amount * params[:branches].to_i).to_i, period: @plan.period  }
		end
    end

    def get_plan_info
        @plan = Plan.find(params[:plan_id])
		render json: { amount: @plan.amount % 1 == 0 ? @plan.amount.to_i : @plan.amount, period: @plan.period },
					status: :ok
    end

    def create_subscription
        start_date = Date.strptime(params[:subscription][:start_date], '%m/%d/%Y')
        branch_ids = params[:subscription][:branches].reject { |b| b == "" || b.nil? }
        @client =  Client.friendly.find(params[:client_id])
        @client.trial.update(free_trial: false, date_subscribed: start_date)
        @subscription = @client.subscriptions.new subscription_params
        @subscription.start_date = start_date
        @subscription.paypal_payment_token = @client.manual_payment_token(start_date)
        @subscription.end_date = start_date + 1.month
        @subscription.branch_count = branch_ids.count
        @subscription.amount = (@subscription.plan.amount * branch_ids.count).to_d 
        @subscription.manual_payment = true
        if @subscription.save
            branches = Branch.where(id: branch_ids)
            branches.map do |br|
                br.create_branch_subscription(
                    subscription_id: @subscription.id, 
                    date_subscribed: start_date, 
                    subs_start: start_date, 
                    subs_end: start_date + 1.month, 
                    manual_payment: true
                )
            end
            redirect_to admin_client_path(@client), notice: "#{@client.name} is now a paid subscriber"
        else
            redirect_to admin_client_path(@client), alert: @subscription.errors.full_messages.join(", ")
        end
    end

    def show_branch_subscriptions
        @subscription = Subscription.find params[:subscription_id]
    end

    def remove_selected_branches
        branch_ids = params[:subscription][:branches].reject { |b| b == "" || b.nil? }
        subscription = Subscription.find params[:subscription_id]
        branch_count = subscription.branch_count - branch_ids.count
        amount = branch_count * subscription.plan.amount    
        subscription.update( amount: amount, branch_count: branch_count ) 
        BranchSubscription.where(id: branch_ids).update_all( active: false )
        redirect_to admin_client_path(subscription.client), notice: "Successfully canelled subscriptions for #{branch_count} " + "branch".pluralize(branch_ids.count)
    end

    def resubscribe_branches
        branch_ids = params[:subscription][:branches].reject { |b| b == "" || b.nil? }
        subscription = Subscription.find params[:subscription_id]
        branch_count = subscription.branch_count + branch_ids.count
        amount = branch_count * subscription.plan.amount    
        subscription.update( amount: amount, branch_count: branch_count )
        BranchSubscription.where(id: branch_ids).update_all( active: true )
        redirect_to admin_client_path(subscription.client), notice: "Successfully re-subscribed #{branch_count} " + "branch".pluralize(branch_ids.count)
    end

    def get_subscription
        
    end

    def update_subscription
        date = params[:subscription][:start_date]
        start_date = Date.strptime(date, "%m/%d/%Y")
        if @subscription.update(start_date: start_date, end_date: start_date + 1.month)
            @subscription.branch_subscriptions.map do |bs|
                bs.update(subs_start: start_date, subs_end: start_date.next_month)
            end
            redirect_to admin_client_path(@subscription.client), notice: "Successfully updated subscriptions"
        else
            redirect_to admin_client_path(@subscription.client), alert: @subscription.errors.full_messages.join(", ")
        end
    end

    private
        def set_client
            @client = Client.friendly.find(params[:id])
        end

        def subscription_params
            params.require(:subscription).permit(:branches, :start_date, :end_date, :paypal_recurring_profile_token, :plan_id)
        end

        def set_subscription
            @subscription = Subscription.find params[:subscription_id]
        end
end
