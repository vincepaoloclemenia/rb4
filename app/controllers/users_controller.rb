class UsersController < ApplicationController
	
	before_action :authenticate_user!
	before_action :access_control, except: [:account, :update_account, :change_password]
	before_action :set_user, only: [:edit, :update, :destroy]

	def index
		@users = current_client.users
	end

	def new
		@user = User.new
	end

	def edit
	end

	def account
		@user = current_client.users.find_by_username(params[:username])
		if current_user == @user
		else
			redirect_to account_path(username: current_user.username)
		end
	end

	def update_account
		@user = current_client.users.find_by_username(params[:username])
		if @user.update_with_password(account_params)
			flash[:notice] = "Account successfully updated"
		else
			flash[:alert] = @user.errors.full_messages.join(", ")
		end
		redirect_to account_path(username: current_user.username)
	end

	def change_password
		@user = current_client.users.find_by_username(params[:username])
		if @user.update_with_password(change_password_params)
			sign_in @user, bypass: true
			flash[:notice] = "Password successfully changed"
		else
			flash[:alert] = @user.errors.full_messages.join(", ")
		end
		redirect_to account_path(username: current_user.username)
	end

	def create
		@user = current_client.users.new(user_params)
		@user.skip_confirmation!
		generated_password = Devise.friendly_token.first(8)
		@user.password = generated_password
		if @user.save
			@user.client_user_access.update(client_user_access_params)
			send_mail(@user.email, @user.password)
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

		def change_password_params
			params.require(:user).permit(:current_password, :password, :password_confirmation)
		end

		def account_params
			params.require(:user).permit(:first_name, :last_name, :avatar, :email, :username, :current_password)
		end

	
		def send_mail(email, generated_password)
			UserMailer.send_user_mail(email, generated_password).deliver
		end
end