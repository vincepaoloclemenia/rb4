class BrandsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_brand, only: [:show, :edit, :update, :destroy]
	before_action :restrict_except_admins, only: [:update_branch_po_setup, :update_po_privilege, :create_branch_po_setup]

	def index
		@brands = current_client.brands
	end

	def show
		@branches = current_client.on_free_trial? ? @brand.branches : @brand.subscribed_branches
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
			@branches = current_client.on_free_trial? ? @brand.branches : @brand.subscribed_branches
			errors = []
			errors << "#{'Branch'.pluralize(@branches.count)}(#{@branches.pluck(:name).join(', ')}) belongs to this brand" if @brand.branches.present?
			errors << "#{'Role'.pluralize(@brand.roles.count)}(#{@brand.roles.pluck(:name).join(', ')}) manages this brand" if @brand.roles.present?
			errors << "An unkonwn reason ( please kindly report to the developers for immediate fixing )" if errors.empty?
			puts e if errors.empty?
      redirect_to brands_path, alert: "You cannot delete brand #{@brand.name} because of the following #{'reason'.pluralize(errors.count)}: #{errors.join('; ')}"
    	end
	end

	def set_purchase_order_restriction
		@setting = current_brand.brand_setting	
	end

	def update_po_schedule
		@setting = current_brand.brand_setting 
	end

	def setup_branch_po_setup
		@branch = Branch.find params[:branch_id]
		@branch_setup = if @branch.branch_purchase_order_setup.present?
							@branch.branch_purchase_order_setup
						else
							@branch.build_branch_purchase_order_setup
						end
	end

	def create_branch_po_setup
		@branch = Branch.find params[:branch_id]	
		action = @branch.build_branch_purchase_order_setup(po_setup_params)
		if action.save
			redirect_to brand_path(@branch.brand), notice: "Purchase Order Setup for #{@branch.name} has successfully updated."
		else
			redirect_to brand_path(@branch.brand), alert: action.errors.full_messages.join(", ")
		end		
	end

	def update_branch_po_setup
		@branch = Branch.find params[:branch_id]	
		@setup = @branch.branch_purchase_order_setup
		@setup.update(po_setup_params)
		if @setup.save
			redirect_to brand_path(@branch.brand), notice: "Purchase Order Setup for #{@branch.name} has successfully updated."
		else
			redirect_to brand_path(@branch.brand), alert: @setup.errors.full_messages.join(", ")
		end		
	end

	def create_purchase_order_setting
		if params[:purchase_order_setting]
			po = params[:purchase_order_setting]
			monday = po[:allow_monday] == '1' ? { day: "monday", allowed: true, from: po[:monday_from], to: po[:monday_to] } : { day: "monday", allowed: false, from: '', to: '' }
			tuesday = po[:allow_tuesday] == '1' ? { day: "tuesday", allowed: true, from: po[:tuesday_from], to: po[:tuesday_to] } : { day: "tuesday", allowed: false, from: '', to: '' }
			wednesday = po[:allow_wednesday] == '1' ? { day: "wednesday", allowed: true, from: po[:wednesday_from], to: po[:wednesday_to] } : { day: "wednesday", allowed: false, from: '', to: '' }
			thursday = po[:allow_thursday] == '1' ? { day: "thursday", allowed: true, from: po[:thursday_from], to: po[:thursday_to] } : { day: "thursday", allowed: false, from: '', to: '' }
			friday = po[:allow_friday] == '1' ? { day: "friday", allowed: true, from: po[:friday_from], to: po[:friday_to] } : { day: "friday", allowed: false, from: '', to: '' }
			saturday = po[:allow_saturday] == '1' ? { day: "saturday", allowed: true, from: po[:saturday_from], to: po[:saturday_to] } : { day: "saturday", allowed: false, from: '', to: '' }
			sunday = po[:allow_sunday] == '1' ? { day: "sunday", allowed: true, from: po[:sunday_from], to: po[:sunday_to] } : { day: "sunday", allowed: false, from: '', to: '' }
			if current_brand.brand_setting.present?
				current_brand.brand_setting.update(
					send_pos: po[:send_pos],
					purchase_order_schedule: [sunday, monday, tuesday, wednesday, thursday, friday, saturday]			
				)	
			else	
				current_brand.create_brand_setting(
					send_pos: po[:send_pos],
					purchase_order_schedule: [sunday, monday, tuesday, wednesday, thursday, friday, saturday]			
				)	
			end
			flash[:notice] = po[:send_pos] ? "You have successully adjusted Purchase Order schedule." : "You have set Purchase Schedule to 'Daily'"		
			redirect_to purchase_order_generator_index_path
		end
	end

	def update_purchase_order_setting
		if params[:purchase_order_setting]
			po = params[:purchase_order_setting]
			monday = po[:allow_monday] == '1' ? { day: "monday", allowed: true, from: po[:monday_from], to: po[:monday_to] } : { day: "monday", allowed: false, from: '', to: '' }
			tuesday = po[:allow_tuesday] == '1' ? { day: "tuesday", allowed: true, from: po[:tuesday_from], to: po[:tuesday_to] } : { day: "tueday", allowed: false, from: '', to: '' }
			wednesday = po[:allow_wednesday] == '1' ? { day: "wednesday", allowed: true, from: po[:wednesday_from], to: po[:wednesday_to] } : { day: "wednesday", allowed: false, from: '', to: '' }
			thursday = po[:allow_thursday] == '1' ? { day: "thursday", allowed: true, from: po[:thursday_from], to: po[:thursday_to] } : { day: "thursday", allowed: false, from: '', to: '' }
			friday = po[:allow_friday] == '1' ? { day: "friday", allowed: true, from: po[:friday_from], to: po[:friday_to] } : { day: "friday", allowed: false, from: '', to: '' }
			saturday = po[:allow_saturday] == '1' ? { day: "saturday", allowed: true, from: po[:saturday_from], to: po[:saturday_to] } : { day: "saturday", allowed: false, from: '', to: '' }
			sunday = po[:allow_sunday] == '1' ? { day: "sunday", allowed: true, from: po[:sunday_from], to: po[:sunday_to] } : { day: "sunday", allowed: false, from: '', to: '' }
			current_brand.brand_setting.update(
				send_pos: po[:send_pos],
				purchase_order_schedule: [sunday, monday, tuesday, wednesday, thursday, friday, saturday]			
			)	
			flash[:notice] = po[:send_pos] ? "You have successully adjusted Purchase Order schedule." : "You have set Purchase Schedule to 'Daily'"		
			redirect_to purchase_order_generator_index_path
		end
	end

	def admins_privileges
		@admins = current_brand.admins.collect { |u| [ "#{u.full_name} ( #{u.username} )", u.id ] }
		if current_brand.brand_setting.present?
			if current_brand.brand_setting.purchase_order_privilege.present?
				@approvers = current_brand.brand_setting.purchase_order_privilege["approvers"]
				@holders = current_brand.brand_setting.purchase_order_privilege["holders"]
			 	@rejectors = current_brand.brand_setting.purchase_order_privilege["rejectors"]
				@senders = current_brand.brand_setting.purchase_order_privilege["senders"]
			end
		else
			@approvers = []
			@holders = []
			@rejectors = []
			@senders = []
		end
	end

	def update_po_privilege
		if params[:admins_privileges].present?
			admin_attribs = params[:admins_privileges]
			approvers = admin_attribs[:approvers].reject{ |u| u == '' }.map { |u| u.to_i }
			holders = admin_attribs[:holders].reject{ |u| u == '' }.map { |u| u.to_i }
			rejectors = admin_attribs[:rejectors].reject{ |u| u == '' }.map { |u| u.to_i }
			senders = admin_attribs[:senders].reject{ |u| u == '' }.map { |u| u.to_i }
			pop = { approvers: approvers, holders: holders, rejectors: rejectors, senders: senders }
			if current_brand.brand_setting.present?
				current_brand.brand_setting.update( purchase_order_privilege: { :approvers => approvers, :holders => holders, :rejectors => rejectors, :senders => senders } )
			else
				current_brand.create_brand_setting( purchase_order_privilege: { :approvers => approvers, :holders => holders, :rejectors => rejectors, :senders => senders } )
			end
			redirect_to purchase_orders_path, notice: "Privileges successfully updated."
		else
			redirect_to purchase_orders_path, alert: "Action cannot be completed"
		end
	end

	private

		def restrict_except_admins
			unless client_admin?
				redirect_to purchase_orders_path, alert: "You are not allowed to change settings for Purchase Orders"
			end
		end

		def po_setup_params
			params.require(:branch_purchase_order_setup).permit(:delivery_address, :delivery_from, :delivery_to)
		end

		def set_brand
			@brand = current_client.brands.friendly.find(params[:id])
		end

		def brand_params
			params.require(:brand).permit(:name, :website, :avatar, :description, :landline_no, :mobile_no, :fax_no, :email, :email_footer)
		end
end
