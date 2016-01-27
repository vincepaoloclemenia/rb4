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
    process :request_payment, description: "#{@subscription.plan.name} for a total of #{@subscription.branch_count} #{'branch'.pluralize(@subscription.branch_count)}",
                              amount: @subscription.amount
    #change the period in live
    process :create_recurring_profile, period: :daily, 
                                      frequency: 1, 
                                      start_at: Time.zone.now, 
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
      ipn_url: "https://2cd523b5.ngrok.com/payment_notifications",
      currency: "USD"
    )
    response = PayPal::Recurring.new(options).send(action)
    raise response.errors.inspect if response.errors.present?
    response
  end
end