class SubscriptionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@subscriptions = current_client.subscriptions.except_free_trial
		@free_trial = current_client.subscriptions.free_trial
	end

	def new
		@subscription = Subscription.new
	end

  def cancel
    subscription = Subscription.find(params[:id])

    ppr = PayPal::Recurring.new(:profile_id => subscription.paypal_recurring_profile_token)
    response = ppr.cancel
    if response.success?
      subscription.status = "Processing"
      subscription.save
      respond_to do |format|
        format.html { redirect_to subscriptions_path, notice: 'Subscription cancellation in progress..' }
        format.json { head :no_content }
      end
    else
      raise response.errors.inspect
    end
  end

  def show_branches
  	@subscription = Subscription.find(params[:subscription_id])
  end

	def process_subscription
		if params[:plan_id] && params[:branches] && params[:PayerID] && params[:token]
			@subscription = current_client.subscriptions.build(plan_id: params[:plan_id], 
																												paypal_customer_token: params[:PayerID],
																												paypal_payment_token: params[:token])
			if @subscription.payment_provided?
				branches = params[:branches]
				plan = @subscription.plan
				@subscription.branch_count = branches.count
				@subscription.amount = plan.amount * branches.count
				@subscription.period = plan.period
				if @subscription.save_with_payment
					branches.each do |b|
						branch = Branch.find(b)
						if branch.subscription && branch.subscription.plan_id.eql?(1)
							branch.subscription.branch_subscriptions.find_by_branch_id(b).destroy
						end
						@subscription.branch_subscriptions.create(branch_id: b)
					end
					redirect_to subscriptions_path, notice: "Subscription is now being processed by PayPal. This could only take a few moments."
				else
					redirect_to subscriptions_path, alert: @subscriptions.errors.full_messages.join(", ")
				end
			end
		end
	end

	def paypal_checkout
		branches = []
		branches = params[:subscription][:branches].select { |b| b.present? }
		if branches.empty?
			redirect_to subscriptions_path, alert: "Subscription creation failed. Please select at least one branch."
		else
			plan = Plan.find(params[:subscription][:plan_id])
	    subscription = current_client.subscriptions.build(plan_id: plan.id)
	    redirect_to subscription.paypal.checkout_url(
	      return_url: process_subscription_url(:plan_id => plan.id, branches: branches),
	      cancel_url: subscriptions_url,
	      description: "#{subscription.plan.name} for a total of #{branches.count} #{'branch'.pluralize(branches.count)}",
	      amount: subscription.plan.amount * branches.count
	    )
	 	end
	end
end