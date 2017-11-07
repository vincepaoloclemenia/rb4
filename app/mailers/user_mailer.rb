class UserMailer < ApplicationMailer
	default from: "restobot@talentium.ph"
  
  def send_user_mail(email, generated_password)
  	@email = email
  	@gen_password = generated_password
  	mail(to: email, subject: 'RESTOBOT Assignment of User')	
  end

  def send_status_notification(order_list, order_per_suppliers)
  	@purchase_order = order_list
  	@purchase_order_items = order_per_suppliers
  	@my_emails = "vincentpaoloclemenia@gmail.com"
  	mail(to: @my_emails, subject: 'Purchase Requirement Notification')
  end
end
