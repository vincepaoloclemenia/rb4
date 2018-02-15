class UserMailer < ApplicationMailer
	require 'mail'
	default from: "restobot@talentium.ph"
	layout 'send_email', only: :send_status_notification
  
  def send_user_mail(email, generated_password)
  	@email = email
  	@gen_password = generated_password
  	mail(to: email, subject: 'RESTOBOT Assignment of User')	
  end

	def send_status_notification(purchase_order, purchase_order_items, user, recipient, subject, contact, title, message)
  	@purchase_order = purchase_order
		@purchase_order_items = purchase_order_items
		@user = user
		@email = recipient
		@subject = subject	
		@contact_person = contact
		@contact_title = title
		@body = message
		mail(to: @email, subject: @subject, template_path: 'layouts', template_name: 'send_email')
		
  end
end
