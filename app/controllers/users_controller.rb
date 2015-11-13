class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = current_client.users
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = current_client.users.new(user_params)
		if @user.save
			@user.client_user_access.update(role_id: params[:user][:role])
			@user.confirm!
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
			@user.client_user_access.update(role_id: params[:user][:role])
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
		params.require(:user).permit(:email, :username, :first_name, :last_name, :password, :password_confirmation)
	end
end