class UserMailer < ApplicationMailer
	require 'mail'
	default from: "restobot@talentium.ph"
	#layout 'send_email', only: :send_status_notification
  
  def send_user_mail(email, generated_password)
  	@email = email
  	@gen_password = generated_password
  	mail(to: email, subject: 'RESTOBOT Assignment of User')	
  end

	def send_purchase_order(purchase_order, purchase_order_items, user, recipient, subject, contact, title, message)
		@purchase_order = purchase_order
		@purchase_order_items = purchase_order_items
		@user = user
		@email = recipient
		@subject = subject	
		@contact_person = contact
		@contact_title = title
		@body = message
		#attachments.inline["#{@purchase_order.brand.avatar_file_name}"] = File.read("#{Rails.root}/public#{@purchase_order.brand.avatar.url}")		
		mail(to: @email, subject: @subject, content_type: 'text/html')
	end
	
	def send_bulk_of_purchase_orders(brand, supplier, purchase_orders, recipient, address, time, date, contact, subject, message)
		@brand = brand
		@supplier = supplier
		@purchase_orders = purchase_orders
		@email = recipient
		@address = address
		@time = time
		@contact = contact
		@date = date
		@subject = subject
		@body = message
		mail(to: @email, subject: @subject, content_type: 'text/html')
	end
end
