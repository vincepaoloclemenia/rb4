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

	def change_brand
		brand = current_client.brands.find(params[:brand_id])
		session[:current_brand_id] = brand.id
		redirect_to dashboard_path, notice: "You are now on #{brand.name}"
	end

	def update_branch
		@brand = Brand.find(params[:brand_id])
	end

	def update_units
		if params[:item_id].empty?
			@units = current_brand.units.none
		else
			item = current_brand.items.find(params[:item_id])
			conversions = current_brand.conversions.where("from_unit_id = ? OR to_unit_id = ?", item.unit_id, item.unit_id)

			@units = current_brand.units.find(conversions.pluck(:from_unit_id, :to_unit_id).flatten.uniq)
			if @units.empty?
				@units << item.unit
			end
		end
	end
end