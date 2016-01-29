class PaypalPayment
  def initialize(subscription)
    @subscription = subscription
  end
  
  def checkout_details
    process :checkout_details
  end
  
  def checkout_url(options)
    process(:checkout, options).checkout_url
  end
  
  def make_recurring
    #change the period in live
    #used PST for start_at because PayPal uses PST
    process :create_recurring_profile, period: :daily, 
                                      frequency: 1, 
                                      start_at: DateTime.now.in_time_zone('Pacific Time (US & Canada)'), 
                                      failed: 1, 
                                      description: "#{@subscription.plan.name} for a total of #{@subscription.branch_count} #{'branch'.pluralize(@subscription.branch_count)}",
                                      amount: @subscription.amount
  end
  
private

  def process(action, options = {})
    options = options.reverse_merge(
      token: @subscription.paypal_payment_token,
      payer_id: @subscription.paypal_customer_token,
      # description: "#{@subscription.plan.name} payment for a total of #{} #{'branch'.pluralize(@subscription.branches.count)}",
      # amount: @subscription.plan.price * @subscription.branches.count,
      ipn_url: "https://2c81ca3a.ngrok.com/payment_notifications",
      currency: "USD"
    )
    response = PayPal::Recurring.new(options).send(action)
    raise response.errors.inspect if response.errors.present?
    response
  end
end