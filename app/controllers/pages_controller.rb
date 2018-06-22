class PagesController < ApplicationController
	
	def index
		if user_signed_in?
			redirect_to dashboard_path
		else
			render layout: false
		end
	end

	def get_units
		if params[:item_id].empty? && params[:supplier_id].empty?
			@units = current_brand.units.none
		else			
			@item = current_brand.items.find(params[:item_id])
			@supplier = Supplier.find(params[:supplier_id])
			@supplier_unit = @supplier.prices.find_by_item_id(@item.id)
			@unit = Unit.find(@supplier_unit.unit.id) unless @supplier_unit.nil?
			@packaging = @supplier_unit.nil? ? 'No specified packaging yet' : @supplier_unit.packaging
			#render json: { packaging: @packaging, unit: @unit }
		end
	end

	def take_units
		if params[:item_id].empty?
			@unit = 'No Specified Unit'
		else
			@item = current_brand.items.find(params[:item_id])
			@unit = @item.unit
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
		if params[:item_id].empty? && params[:purchase_id].empty?
			@units = current_brand.units.none
		else			
			@item = current_brand.items.find(params[:item_id])
			@purchase = Purchase.find(params[:purchase_id])
			@supplier_unit = @purchase.supplier.prices.find_by_supplier_id_and_item_id(@purchase.supplier.id, @item.id)
			@unit = Unit.find(@supplier_unit.unit.id) unless @supplier_unit.nil?
		end
	end

	def update_price
		if params[:item_id].empty? && params[:purchase_id].empty?
			render json: { price: 0.00 }
		else
			@purchase = Purchase.find(params[:purchase_id])
			@item = current_brand.items.find(params[:item_id])
			@amount = @item.supplier_item_prices.find_by_supplier_id_and_item_id(@purchase.supplier, @item)
			@price = @amount.supplier_amount unless @amount.nil?
			if @price
				render json: { price: @price }
			else
				render json: { price: 0.00 }		
			end
		end
	end

	def get_price
		if params[:item_id].empty? && params[:amount].empty? && params[:supplier_id].empty?
			render json: { price: 0.00 }
		else
			@item = current_brand.items.find(params[:item_id])
			@supplier = Supplier.find(params[:supplier_id])
			@amount = params[:amount]
			@price = @item.supplier_item_prices.find_by_supplier_id_and_item_id(@supplier.id, @item.id)	
			@total = (@amount.to_f * @price.supplier_amount) if @price.present?
			if @total
				render json: { total: @total, price: @price.supplier_amount }
			else
				render json: { total: 0.00 }
			end
		end
	end

	def validate_time
		if params[:from]
			begin
				params[:from].to_time
			rescue ArgumentError
				render json: { error: "Invalid time input" }
			end
		end		
	end

	def get_plan_info
		@plan = Plan.find(params[:plan_id])
		render json: { amount: @plan.amount % 1 == 0 ? @plan.amount.to_i : @plan.amount, period: @plan.period },
					status: :ok
	end

	def get_total_amount
		@plan = Plan.find(params[:plan_id].to_i)
		if current_client.has_subscribed?
			branches_count = current_client.branches.size
			selected_branches = params[:branches].to_i
			render json: { branch_count: "(#{selected_branches}) #{selected_branches > 1 ? 'branches' : 'branch' }", new_amount: @plan.amount * selected_branches, amount: (@plan.amount * (branches_count + selected_branches)).to_i, period: @plan.period }
		else
			render json: { amount: (@plan.amount * params[:branches].to_i).to_i, period: @plan.period  }
		end
	end

	def registration_validate_email
		@taken = User.all.pluck(:email).include? params[:email]
		@email = params[:email]
	end

	def registration_validate_username
		@taken = User.all.pluck(:username).include? params[:username]
		@username = params[:username]
	end

	def new_password_validate_email
		@user = User.find_by_email(params[:email])
		@email = params[:email]
	end
end