class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]

	def index
		redirect_to dashboard_path if user_signed_in?
	end

	def dashboard
	end

	def update_role
		@role = Role.find(params[:role_id])
		unless @role.role_level == "client"
			@brand = Brand.find(params[:brand_id])
		end
	end

	def update_branch
		@brand = Brand.find(params[:brand_id])
	end
end