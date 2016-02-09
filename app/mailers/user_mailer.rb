class UserMailer < ApplicationMailer
	default from: "restobot@appsource.biz"
  
  def send_user_mail(email, generated_password)
  	@email = email
  	@gen_password = generated_password
  	mail(to: email, subject: 'RESTOBOT Assignment of User')	
  end
end
