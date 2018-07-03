class SubscriptionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@subscriptions = current_client.subscriptions
		@free_trial = current_client.trial
		@branches_count = current_client.branches.count
	end

	def new
		@subscription = current_client.subscription
	end

	def subscribe
		@subscription = current_client.subscriptions.new
		@branches = current_client.branches.pluck :name
		@action = current_client.has_subscribed? ? "update" : "create"
	end

  def cancel
    subscription = Subscription.find(params[:id])

    ppr = PayPal::Recurring.new(:profile_id => subscription.paypal_recurring_profile_token)
    response = ppr.cancel
    if response.success?
      subscription.status = "Cancelled"
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
		if params[:branches] && params[:PayerID] && params[:token]
			branches = params[:branches]
			plan = Plan.find 2
			@subscription = current_client.subscriptions.build
			@subscription.paypal_customer_token = params[:PayerID]
			@subscription.paypal_payment_token = params[:token]	
			@subscription.plan_id = plan.id
			@subscription.branch_count = branches.count
			@subscription.amount = plan.amount * branches.count
			@subscription.period = plan.period	
			if @subscription.request_pay
				if @subscription.save_with_payment
					current_client.unsubscribed_branches.where(id: branches).each do |branch|
						branch.create_branch_subscription(subscription_id: @subscription.id)
					end
					redirect_to subscriptions_path, notice: "Thank you for Subscribing! Your subscription is now being processed through PayPal. This would only take a few moments."
				else
					redirect_to subscriptions_path, alert: @subscription.errors.full_messages.join(", ")
				end
			else 
				redirect_to subscriptions_path, alert: @subscription.errors.full_messages.join(", ")
			end
		end
	end

	def update_subscription
		if params[:branches] && params[:PayerID] && params[:token] && params[:subscription_id]
			branches = params[:branches]
			existing_branch_count = current_client.branches.size
			plan = Plan.find 2
			@subscription = current_client.subscriptions.find params[:subscription_id]
			@subscription.paypal_payment_token = params[:token]
			@subscription.paypal_customer_token = params[:PayerID]
			@subscription.plan_id = plan.id
			@subscription.branch_count = branches.count
			@subscription.amount = plan.amount * ( branches.count + existing_branch_count )
			@subscription.period = plan.period
			if @subscription.update_with_payment
				current_client.unsubscribed_branches.where(id: branches).each do |branch|
					branch.create_branch_subscription(subscription_id: @subscription.id)
				end
				redirect_to subscriptions_path, notice: "You have successfully updated your subscription for additional #{branches.count + existing_branch_count} branch(es). This could only take a few moments."
			else
				redirect_to subscriptions_path, alert: @subscription.errors.full_messages.join(", ")
			end
		end
	end

	def paypal_checkout
		branches = params[:subscription][:branches].select { |b| b.present? }
		#branches = params[:subscription][:branches].select { |b| b.present? }
		if branches.empty?
			redirect_to subscriptions_path, alert: "Subscription creation failed. You dont have branches to pay yet."
		else
			plan = Plan.find 2
			subscription = current_client.subscriptions.build(plan_id: plan.id)
			if params[:subscription][:paypal_action].eql? 'create'
				redirect_to subscription.paypal.checkout_url(
					return_url: process_subscription_url(:plan_id => plan.id, branches: branches),
					cancel_url: subscriptions_url,
					description: "#{plan.name} for a total of #{branches.count} #{'branch'.pluralize(branches.count)}",
					amount: plan.amount * branches.count,
					currency: "PHP"
				)
			else
				branches_count = current_client.branches.size + branches.count
				redirect_to subscription.paypal.checkout_url(
					return_url: update_subscription_url(:plan_id => plan.id, branches: branches),
					cancel_url: subscriptions_url,
					description: "#{plan.name} for a total of #{branches_count} #{'branch'.pluralize(branches_count)}",
					amount: plan.amount * branches_count,
					currency: "PHP"
				)
			end
		 end
	end
end