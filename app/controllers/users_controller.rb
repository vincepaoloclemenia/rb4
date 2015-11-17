class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = current_client.users
	end

	def show
	end

	def new
		@user = current_client.users.new
	end

	def create
		@user = current_client.users.new(user_params)
		if @user.save!
			@user.client_user_access.update(role_id: params[:user][:role])
			redirect_to company_user_path(@user), notice: "User successfully created"
		else
			flash[:alert] = @user.errors.full_messages.join(", ")
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to company_user_path(@user), notice: "User successfully updated"
		else
			flash[:alert] = @user.errors.full_messages.join(", ")
			render 'edit'
		end
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
end