class RegistrationsController < Devise::RegistrationsController
	protected

	def after_inactive_sign_up_path_for(resource)
		flash[:notice] = "Registration successful. Please check the email confirmation the we sent to your email"
		new_user_session_path
	end
end