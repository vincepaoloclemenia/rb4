class Admin::ClientsController < Admin::AdminBaseController
    before_action :return_login
    before_action :set_client, only: [:show, :edit, :update, :get_total_amount, :create_subscription]
    
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
    end


    private
        def set_client
            @client = Client.friendly.find(params[:id])
        end
end
