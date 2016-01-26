class SubscriptionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@subscriptions = current_client.subscriptions
	end

	def new
		@subscription = Subscription.new
	end

	# def create
	# 	@branches = params[:subscription][:branches].select { |b| b.present? }
	# 	if @branches.empty?
	# 		redirect_to subscriptions_path, alert: "Please select at least one branch"
	# 	else
	# 		@plan = Plan.find(params[:subscription][:plan_id])
	# 		@subscription = current_client.subscriptions.create(plan_id: @plan.id,
	# 																												branch_count: @branches.count,
	# 																												period: @plan.period,
	# 																												amount: @plan.amount * @branches.count,
	# 																												status: "Payment in process")
	# 		@branches.each do |b|
	# 			@subscription.branch_subscriptions.create(branch_id: b)
	# 		end

	# 		#paypal

	# 		ppr = PayPal::Recurring.new(
	# 			return_url: subscriptions_url,
	# 			cancel_url: subscriptions_url,
	# 			description: "TEST DESCRIPTION",
	# 			amount: "8.00",
	# 			currency: "USD"
	# 		)

	# 		response = ppr.checkout
	# 		if response.valid?
	# 			redirect_to response.checkout_url
	# 		else
	# 			raise response.errors.inspect
	# 		end
	# 	end
	# end

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
		plan = Plan.find(params[:subscription][:plan_id])
		branches = []
		branches = params[:subscription][:branches].select { |b| b.present? }
    subscription = current_client.subscriptions.build(plan_id: plan.id)
    redirect_to subscription.paypal.checkout_url(
      return_url: process_subscription_url(:plan_id => plan.id, branches: branches),
      cancel_url: subscriptions_url,
      description: "#{subscription.plan.name} for a total of #{branches.count} #{'branch'.pluralize(branches.count)}",
      amount: subscription.plan.amount * branches.count
    )
	end
end