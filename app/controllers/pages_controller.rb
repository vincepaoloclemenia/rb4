class PagesController < ApplicationController
	
	def index
		if user_signed_in?
			redirect_to dashboard_path
		else
			render layout: false
		end
	end

	def update_role
		@role = Role.find(params[:role_id])
		@role_field_id = "##{params[:role_field_id]}"
		# unless @role.role_level == "client"
		# 	@brand = Brand.find(params[:brand_id])
		# end
		#render json: { role_level: @role.role_level }
	end

	def change_brand
		brand = current_client.brands.find(params[:brand_id])
		session[:current_brand_id] = brand.id
		redirect_to dashboard_path, notice: "You are now on #{brand.name}"
	end

	def update_branch
		@brand = Brand.find(params[:brand_id])
		@brand_field_id = "##{params[:brand_field_id]}"
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

	def get_plan_info
		@plan = Plan.find(params[:plan_id])
		render json: { amount: @plan.amount, period: @plan.period },
					status: :ok
	end

	def registration_validate_email
		@taken = User.all.pluck(:email).include? params[:email]
		@email = params[:email]
	end

	def registration_validate_username
		@taken = User.all.pluck(:username).include? params[:username]
		@username = params[:username]
	end
end