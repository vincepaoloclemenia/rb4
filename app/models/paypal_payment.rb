class PaypalPayment
  def initialize(subscription)
    @subscription = subscription
  end
  
  def checkout_details
    process :checkout_details, token: @subscription.paypal_payment_token,
                              payer_id: @subscription.paypal_customer_token
  end
  
  def checkout_url(options)
    process(:checkout, options).checkout_url
  end

  def ask_payment
    process :request_payment, payer_id: @subscription.paypal_customer_token,
                              token: @subscription.paypal_payment_token,
                              description: "#{@subscription.plan.name} for a total of #{@subscription.branch_count} #{'branch'.pluralize(@subscription.branch_count)}",
                              amount: @subscription.amount
  end
  
  def make_recurring
    #change the period in live
    #used PST for start_at because PayPal uses PST
    process :create_recurring_profile, period: :monthly, 
                                      frequency: 1, 
                                      payer_id: @subscription.paypal_customer_token,
                                      token: @subscription.paypal_payment_token,
                                      start_at: DateTime.now.in_time_zone('Pacific Time (US & Canada)'), 
                                      failed: 1, 
                                      description: "#{@subscription.plan.name} for a total of #{@subscription.branch_count} #{'branch'.pluralize(@subscription.branch_count)}",
                                      amount: @subscription.amount
  end

  def update_recurring
    process :update_recurring_profile, period: :monthly,
                                        profile_id: @subscription.paypal_recurring_profile_token,
                                        email: @subscription.paypal_email,
                                        description: "#{@subscription.plan.name} for a total of #{@subscription.branch_count} #{'branch'.pluralize(@subscription.branch_count)}",
                                        amount: @subscription.amount,
                                        note: "Added new #{@subscription.branch_count - @subscription.client.branches.size} branch(es)",
                                        outstanding: :next_billing,
                                        start_at: DateTime.now.in_time_zone('Pacific Time (US & Canada)') + 40.days
  end

private

  def process(action, options = {})
    ipn_url = ENV['RAILS_ENV'].eql?('development') ? "https://2c81ca3a.ngrok.com/payment_notifications" : "http://restobotv4.cloudapp.net/payment_notifications"
    options = options.reverse_merge(
      ipn_url: ipn_url,
      currency: "PHP"
    )
    response = PayPal::Recurring.new(options).send(action)
    if response.success?
      response
    else
      @subscription.errors.add("Warning: ", " #{response.errors.first[:messages].first}")
      false
    end
  end
end