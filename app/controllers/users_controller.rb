class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_user, only: [:update, :destroy]

	def index
		@users = current_client.users
		@user = User.new
	end

	def create
		@user = current_client.users.new(user_params)
		if @user.save
			@user.client_user_access.update(client_user_access_params)
			flash[:notice] = "User successfully created"
		else
			flash[:alert] = @user.errors.full_messages.join(", ")
		end
		redirect_to company_users_path
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "User successfully updated"
		else
			flash[:alert] = @user.errors.full_messages.join(", ")
		end
		redirect_to company_users_path
	end

	def destroy
		@user.destroy
		redirect_to company_users_path, notice: "User successfully deleted"
	end

	private

	def set_user
		@user = current_client.users.find(params[:id])
	end

	def user_params
		role = Role.find(params[:user][:client_user_access_attributes][:role_id])
		if role.role_level == 'client'
			params[:user][:client_user_access_attributes].delete(:brand_id)
			params[:user][:client_user_access_attributes].delete(:branch_id)
		elsif role.role_level == 'brand'
			params[:user][:client_user_access_attributes].delete(:branch_id)
		else
		end
		params.require(:user).permit(:email, :username, :first_name, :last_name, :password, :password_confirmation, :confirmed_at, client_user_access_attributes: [:id, :role_id, :client_id, :brand_id, :branch_id])
	end

	def client_user_access_params
		params.require(:user).require(:client_user_access_attributes).permit(:role_id, :client_id, :brand_id, :branch_id)
	end
end