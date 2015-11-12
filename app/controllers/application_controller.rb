class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :find_wizard_flag

  helper_method :current_client, :current_brand

  def current_client
    current_user.client
  end

  def current_brand
    unless session[:current_brand_id]
      if current_user.role.role_level.eql?("client")
        session[:current_brand_id] = current_client.brands.first.id
      else
        session[:current_brand_id] = current_user.brand.id
      end
    end
    @current_brand = Brand.find(session[:current_brand_id])
  end

  def find_wizard_flag
    #find better fix for destroy_user_session_path with this method
    after_in if user_signed_in? && params[:controller] != "devise/sessions" && params[:action] != "destroy"
  end

  # => Rescue when deleting associated records ( brand & branch ).
  # rescue_from 'ActiveRecord::InvalidForeignKey' do |e|
  #   if params[:controller] == "brands"
  #     flash[:alert] = "You cannot delete #{@branch.name} because it have branches"
  #     redirect_to brands_path
  #   elsif params[:controller] == "branches"
  #     flash[:alert] = "This branch have Branch administrators please change their respective branches then delete"
  #     redirect_to branches_path
  #   else
  #     flash[:alert] = "Something went wrong, your request is not processed"
  #     puts "======= rescue InvalidForeignKey else ========"
  #     puts params
  #     puts "======= rescue end ========"
  #     redirect_to dashboard_path
  #   end
  # end

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
