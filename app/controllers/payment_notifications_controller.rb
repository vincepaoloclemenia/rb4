class PaymentNotificationsController < ApplicationController
	protect_from_forgery :except => [:create]
	skip_before_filter :authenticate_user!

	def create
    response = validate_IPN_notification(request.raw_post)
    case response
    when "VERIFIED"
      # check that paymentStatus=Completed
      # check that txnId has not been previously processed
      # check that receiverEmail is your Primary PayPal email
      # check that paymentAmount/paymentCurrency are correct
      # process payment
     	case params[:txn_type]
     	when "recurring_payment_profile_created"
     		subscription = Subscription.find_by_paypal_recurring_profile_token(params[:recurring_payment_id])
     		subscription.update_attributes(status: params[:profile_status], 
     																	previous_payment: DateTime.now.in_time_zone, 
     																	next_payment: DateTime.now.in_time_zone + 1.send(subscription.plan.period_without_ly), 
     																	outstanding_balance: params[:outstanding_balance])
     		# subscription.bills.create(amount: subscription.amount,
     		# 													payer_email: subscription.paypal_email,
     		# 													status: "Completed",
     		# 													branches: subscription.branches.pluck(:name).join(", "),
       #                            client_id: subscription.client_id)
     	when "recurring_payment"
     		subscription = Subscription.find_by_paypal_recurring_profile_token(params[:recurring_payment_id])
     		subscription.update_attributes(previous_payment: DateTime.now.in_time_zone, 
     																	next_payment: DateTime.now.in_time_zone + 1.send(subscription.plan.period_without_ly),
     																	outstanding_balance: params[:outstanding_balance])
     		subscription.bills.create(amount: params[:mc_gross],
     															payer_email: subscription.paypal_email,
     															status: params[:payment_status],
     															branches: subscription.branches.pluck(:name).join(", "),
     															transaction_id: params[:txn_id])
     	when "recurring_payment_outstanding_payment"
     	when "recurring_payment_expired"
     		subscription = Subscription.find_by_paypal_recurring_profile_token(params[:recurring_payment_id])
     		subscription.update_attributes(status: params[:profile_status])
     	when "recurring_payment_failed"
     	when "recurring_payment_profile_cancel"
        #cancel recurring profile (DELETE)
     		subscription = Subscription.find_by_paypal_recurring_profile_token(params[:recurring_payment_id])
     		subscription.update_attributes(status: params[:profile_status])
     	when "recurring_payment_skipped"
     	when "recurring_payment_suspended"
        #suspend recurring profile (PAUSE)
     		subscription = Subscription.find_by_paypal_recurring_profile_token(params[:recurring_payment_id])
     		subscription.update_attributes(status: params[:profile_status])
     	when "recurring_payment_suspended_due_to_max_failed_payment"
     		subscription = Subscription.find_by_paypal_recurring_profile_token(params[:recurring_payment_id])
     		subscription.update_attributes(status: params[:profile_status])
     	when "express_checkout"
     	else
     	end

     	params_arr = []
     	params.each do |key,value|
     		params_arr << "#{key}=#{value}"
     	end

     	if subscription
     		subscription.payment_notifications.create(params: params_arr.join("|"), status: params[:payment_status], transaction_type: params[:txn_type], transaction_id: params[:txn_id])
     	else
     		PaymentNotification.create(params: params_arr.join("|"), status: params[:payment_status], transaction_type: params[:txn_type], transaction_id: params[:txn_id])
     	end
    when "INVALID"
      # log for investigation
      puts "========================================="
      puts "INVALID"
      puts "========================================="
      puts request.raw_post
      puts "========================================="
    else
      # error
    end
    render :nothing => true
  end

  protected 
  def validate_IPN_notification(raw)
    # live url 'https://www.paypal.com/cgi-bin/webscr'
    uri = URI.parse('https://sandbox.paypal.com/cgi-bin/webscr?cmd=_notify-validate')
    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = 60
    http.read_timeout = 60
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    response = http.post(uri.request_uri, raw,
                         'Content-Length' => "#{raw.size}"
                         #'User-Agent' => "My custom user agent"
                       ).body
  end
end