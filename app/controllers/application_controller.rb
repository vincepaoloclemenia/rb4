class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_wizard_flag

  helper_method :current_client

  def current_client
    current_user.client
  end

  def find_wizard_flag
    #find better fix for destroy_user_session_path with this method
    after_in if user_signed_in? && params[:controller] != "devise/sessions" && params[:action] != "destroy"
  end

  private

  def after_in
    if current_user.flag >= 1 && current_user.flag < 6
      redirect_to wizard_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:flag, :username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
