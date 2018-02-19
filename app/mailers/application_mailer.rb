class ApplicationMailer < ActionMailer::Base
  add_template_helper(EmailHelper)
  default from: "restobot@talentium.ph"

  # def send_user_mail
  # 	@my_email = 'reynan.albaredo@gmail.com'
  # 	mail(to: @my_email, subject: 'RESTOBOT Assignment of User')	
  # end
end
