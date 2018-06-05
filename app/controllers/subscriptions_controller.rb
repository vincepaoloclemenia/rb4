class SubscriptionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@subscriptions = current_client.subscription
		@free_trial = current_client.subscription
		@branches_count = current_client.branches.count
	end

	def new
		@subscription = current_client.subscription
	end

	def subscribe
		@subscription = current_client.subscription
		@branches = current_client.branches.pluck :name
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
		@branches = current_client.branches
		@color = if current_client.free_trial?
			current_client.on_free_trial? ? "green" : "red"
		else 
			current_client.has_paid_subscription? ? "green" : "red"
		end
		@label = if current_client.free_trial?
							current_client.on_free_trial? ? "" : "Expired"
						else
							""
						end
  end

	def process_subscription
		if params[:plan_id] && params[:PayerID] && params[:token]
			current_client.subscription.update(
				free_trial: false, 
				plan_id: params[:plan_id],
				paypal_customer_token: params[:PayerID],
				paypal_payment_token: params[:token],
				start_date: DateTime.now,
				end_date: DateTime.now + 1.month
			)
			@subscription = current_subscription

			if @subscription.payment_provided?
				branches = current_client.branches
				plan = @subscription.plan
				@subscription.branch_count = branches.count
				@subscription.amount = plan.amount * branches.count
				@subscription.period = plan.period
				if @subscription.save_with_payment
					redirect_to subscriptions_path, notice: "Subscription is now being processed by PayPal. This could only take a few moments."
				else
					redirect_to subscriptions_path, alert: @subscriptions.errors.full_messages.join(", ")
				end
			end
		end
	end

	def paypal_checkout
		branches = current_client.branches
		#branches = params[:subscription][:branches].select { |b| b.present? }
		if branches.empty?
			redirect_to subscriptions_path, alert: "Subscription creation failed. You dont have branches to pay yet."
		else
			plan = Plan.find(params[:subscription][:plan_id])
	    subscription = current_client.subscription
	    redirect_to subscription.paypal.checkout_url(
	      return_url: process_subscription_url(:plan_id => plan.id),
	      cancel_url: subscriptions_url,
	      description: "#{subscription.plan.name} for a total of #{branches.count} #{'branch'.pluralize(branches.count)}",
				amount: plan.amount * branches.count,
				currency: "PHP"
	    )
	 	end
	end
end