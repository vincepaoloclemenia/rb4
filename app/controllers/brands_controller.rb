class BrandsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_brand, only: [:show, :edit, :update, :destroy]

	def index
		@brands = current_client.brands
	end

	def show
		@branches = @brand.branches
	end

	def new
		@brand = Brand.new
	end

	def create
		@brand = current_client.brands.new(brand_params)
		if @brand.save
			flash[:notice] = "Brand sucessfully created"
		else
			flash[:alert] = @brand.errors.full_messages.join(", ")
		end
		redirect_to brands_path
	end

	def update
		# respond_to do |format|
		# 	if @brand.update(brand_params)
		# 		@success = true
		# 		flash[:notice] = "Successfully updated"
		# 	else
		# 		@success = false
		# 		flash[:alert] = @brand.errors.full_messages.join(", ")
		# 	end
		# 	format.js
		# end
		if @brand.update(brand_params)
			redirect_to brand_path(@brand), notice: "Brand successfully updated"
		else
			redirect_to brand_path(@brand), alert: @brand.errors.full_messages.join(", ")
		end
	end

	def destroy
		begin
			if @brand.id == session[:current_brand_id].to_i
				session[:current_brand_id] = current_client.brands.first.id
				@brand.destroy
				redirect_to brands_path, notice: "Brand successfully deleted and switched to #{current_brand.name}"
			else
				@brand.destroy
				redirect_to brands_path, notice: "Brand successfully deleted"
			end
		rescue ActiveRecord::InvalidForeignKey => e
			errors = []
			errors << "#{'Branch'.pluralize(@brand.branches.count)}(#{@brand.branches.pluck(:name).join(', ')}) belongs to this brand" if @brand.branches.present?
			errors << "#{'Role'.pluralize(@brand.roles.count)}(#{@brand.roles.pluck(:name).join(', ')}) manages this brand" if @brand.roles.present?
			errors << "An unkonwn reason ( please kindly report to the developers for immediate fixing )" if errors.empty?
			puts e if errors.empty?
      redirect_to brands_path, alert: "You cannot delete brand #{@brand.name} because of the following #{'reason'.pluralize(errors.count)}: #{errors.join('; ')}"
    	end
	end

	def set_purchase_order_restriction
	end

	def update_po_schedule
		@setting = current_brand.brand_setting	
	end

	def create_purchase_order_setting
		if params[:purchase_order_setting]
			po = params[:purchase_order_setting]
			monday = po[:allow_monday] == '1' ? { day: 1, allowed: true, from: po[:monday_from], to: po[:monday_to] } : { day: 1, allowed: false, from: '', to: '' }
			tuesday = po[:allow_tuesday] == '1' ? { day: 2, allowed: true, from: po[:tuesday_from], to: po[:tuesday_to] } : { day: 2, allowed: false, from: '', to: '' }
			wednesday = po[:allow_wednesday] == '1' ? { day: 3, allowed: true, from: po[:wednesday_from], to: po[:wednesday_to] } : { day: 3, allowed: false, from: '', to: '' }
			thursday = po[:allow_thursday] == '1' ? { day: 4, allowed: true, from: po[:thursday_from], to: po[:thursday_to] } : { day: 4, allowed: false, from: '', to: '' }
			friday = po[:allow_friday] == '1' ? { day: 5, allowed: true, from: po[:friday_from], to: po[:friday_to] } : { day: 5, allowed: false, from: '', to: '' }
			saturday = po[:allow_saturday] == '1' ? { day: 6, allowed: true, from: po[:saturday_from], to: po[:saturday_to] } : { day: 6, allowed: false, from: '', to: '' }
			sunday = po[:allow_sunday] == '1' ? { day: 0, allowed: true, from: po[:sunday_from], to: po[:sunday_to] } : { day: 0, allowed: false, from: '', to: '' }
			current_brand.create_brand_setting(
				send_pos: po[:send_pos],
				purchase_order_schedule: [sunday, monday, tuesday, wednesday, thursday, friday, saturday]			
			)	
			flash[:notice] = po[:send_pos] ? "You have successully adjusted Purchase Order schedule." : "You have set Purchase Schedule to 'Daily'"		
			redirect_to purchase_order_generator_index_path
		end
	end

	def update_purchase_order_setting
		if params[:purchase_order_setting]
			po = params[:purchase_order_setting]
			monday = po[:allow_monday] == '1' ? { day: 1, allowed: true, from: po[:monday_from], to: po[:monday_to] } : { day: 1, allowed: false, from: '', to: '' }
			tuesday = po[:allow_tuesday] == '1' ? { day: 2, allowed: true, from: po[:tuesday_from], to: po[:tuesday_to] } : { day: 2, allowed: false, from: '', to: '' }
			wednesday = po[:allow_wednesday] == '1' ? { day: 3, allowed: true, from: po[:wednesday_from], to: po[:wednesday_to] } : { day: 3, allowed: false, from: '', to: '' }
			thursday = po[:allow_thursday] == '1' ? { day: 4, allowed: true, from: po[:thursday_from], to: po[:thursday_to] } : { day: 4, allowed: false, from: '', to: '' }
			friday = po[:allow_friday] == '1' ? { day: 5, allowed: true, from: po[:friday_from], to: po[:friday_to] } : { day: 5, allowed: false, from: '', to: '' }
			saturday = po[:allow_saturday] == '1' ? { day: 6, allowed: true, from: po[:saturday_from], to: po[:saturday_to] } : { day: 6, allowed: false, from: '', to: '' }
			sunday = po[:allow_sunday] == '1' ? { day: 0, allowed: true, from: po[:sunday_from], to: po[:sunday_to] } : { day: 0, allowed: false, from: '', to: '' }
			current_brand.brand_setting.update(
				send_pos: po[:send_pos],
				purchase_order_schedule: [sunday, monday, tuesday, wednesday, thursday, friday, saturday]			
			)	
			flash[:notice] = po[:send_pos] ? "You have successully adjusted Purchase Order schedule." : "You have set Purchase Schedule to 'Daily'"		
			redirect_to purchase_order_generator_index_path
		end
	end

	private

		def set_brand
			@brand = current_client.brands.find(params[:id])
		end

		def brand_params
			params.require(:brand).permit(:name, :website, :avatar, :description, :landline_no, :mobile_no, :fax_no, :email, :email_footer)
		end
end
