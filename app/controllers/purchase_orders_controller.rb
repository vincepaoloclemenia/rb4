class PurchaseOrdersController < ApplicationController
	include PurchaseOrderHelper
	before_action :authenticate_user!
	before_action :access_control

	def index
		@purchase_orders = current_user.role.role_level == 'branch' ? current_user.branch.purchase_orders.paginate(page: params[:page], per_page: per_page) : current_brand.purchase_orders.new_pos.paginate(page: params[:page], per_page: per_page)
		@purchase_order = PurchaseOrder.new
		@suppliers = (current_brand.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
	end

	def new
		@purchase_order = current_brand.purchase_orders.new
		@suppliers = (current_brand.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
		if current_user.role.role_level.eql? 'branch'
			@po_number = po_number_format(current_user.branch) 
			@po_ref =  PurchaseOrder.all.select(:id).order("id ASC").last.nil? ? 1 : (PurchaseOrder.all.select(:id).order("id ASC").last.id + 1).to_s
		end
	end

	def show
	end

	def create
		if current_user.role.role_level.eql? 'branch'
			@purchase_order = current_user.branch.purchase_orders.create(purchase_order_params)
			@purchase_order.brand_id = current_user.brand.id
			@purchase_order.client_id = current_user.client.id
			@purchase_order.status = 'Pending'
			@purchase_order.user_id = current_user.id
			if @purchase_order.save
				flash[:notice] = 'Purchase order successfully created'
				redirect_to purchase_order_purchase_order_items_path(purchase_order_id: @purchase_order.id)
			else
				flash[:alert] = @purchase_order.errors.full_messages.join(', ')
				redirect_to purchase_orders_path
			end
		else
			@date = params[:purchase_order][:delivery_date].present? ? Date.strptime(params[:purchase_order][:delivery_date], '%m/%d/%Y') : nil
			@purchase_order = current_client.purchase_orders.create(purchase_order_params)
			@purchase_order.brand_id = current_brand.id
			@purchase_order.delivery_date = @date
			@purchase_order.user_id = current_user.id
			if @purchase_order.save
				flash[:notice] = 'Purchase order successfully created'
				redirect_to purchase_order_purchase_order_items_path(purchase_order_id: @purchase_order.id)
			else
				flash[:alert] = @purchase_order.errors.full_messages.join(', ')
				redirect_to purchase_orders_path
			end
		end
	end

	def update
		# @purchase_order = current_brand.purchases.find(params[:id])
		@purchase_order = PurchaseOrder.find(params[:id])
		respond_to do |format|
			if @purchase_order.update(purchase_order_params)
				# @purchase_order.update(user_modified_by_id: current_user.id)
				index
				@success = true
				flash[:notice] = "Purchase Order successfully updated"
			else
				@success = false
				flash[:alert] = @purchase_order.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchases_path
	end

	def destroy
		@purchase_order = PurchaseOrder.find(params[:id])
		respond_to do |format|
			if @purchase_order.destroy
				index
				@success = true
				flash[:notice] = "Purchase Order successfully deleted"
			else
				@success = false
				flash[:alert] = @purchase_order.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchases_path, notice: "Purchase successfully deleted" if current_user.role.role_level.eql? 'branch'
	end

	def approve
		if params[:purchase_order_id].present? && params[:approval].present?
			approval = params[:approval]
			@delivery_date = Date.strptime(approval[:delivery_date], '%m/%d/%Y')
			@delivery_time = "#{approval[:from_time]} #{approval[:from_ampm]} - #{approval[:to_time]} #{approval[:to_ampm]}"
			@purchase_order = PurchaseOrder.find(params[:purchase_order_id])
			@po_number = po_approval_format(@purchase_order)
			@purchase_order.update(status: 'Approved', po_number: @po_number, po_date: Date.today, delivery_date: @delivery_date, delivery_time: @delivery_time )
			if @purchase_order.save
				redirect_to purchase_order_purchase_order_items_path(@purchase_order), notice: "You approved #{@purchase_order.branch.name} purchase order"
			else
				redirect_to purchase_order_purchase_order_items_path(@purchase_order), alert: @purchase_order.errors.full_messages.join(', ')
			end
		end
	end

	def hold
		if params[:purchase_order_id].present?
			@purchase_order = PurchaseOrder.find(params[:purchase_order_id])
			@purchase_order.update(status: 'On Hold')
			if @purchase_order.save
				redirect_to purchase_orders_path, notice: "#{@purchase_order.branch.name} purchase order was marked 'On Hold' "
			else
				redirect_to purchase_orders_path, alert: @purchase_order.errors.full_messages.join(', ')
			end
		end
	end

	def reject
		if params[:purchase_order_id].present?
			@purchase_order = PurchaseOrder.find(params[:purchase_order_id])
			@purchase_order.update(status: 'Rejected')
			if @purchase_order.save
				redirect_to purchase_orders_path, notice: "You rejected #{@purchase_order.branch.name} purchase order"
			else
				redirect_to purchase_orders_path, alert: @purchase_order.errors.full_messages.join(', ')
			end
		end
	end

	def send_email_notification
		@purchase_order = current_brand.purchase_orders.find(params[:po])
		@purchase_order_items = @purchase_order.purchase_order_items.all
		@subject = params[:po_email][:subject]
		@person = params[:po_email][:contact_person]
		@recipients = params[:po_email][:recipients]
		@title = params[:po_email][:contact_title]
		@message = params[:po_email][:body]
		@from = params[:po_email][:from]
		
		@recipients.map do |recipient|
			if recipient == ''
				next
			else
				UserMailer.send_purchase_order(
					@purchase_order, 
					@purchase_order_items, 
					current_user,
					recipient,
					@subject,
					@person,
					@title,
					@message
				).deliver_now
			end
		end	
		redirect_to purchase_order_generator_index_path, notice: "Your email to #{@purchase_order.supplier.name} has been sent."	
	end

	def purchase_order
		@purchase_order = current_brand.purchase_orders.find(params[:purchase_order_id])
		@po_items =  @purchase_order.purchase_order_items
		respond_to do |format|
			format.html
			format.json
			format.pdf {render template: 'purchase_orders/purchase_order', pdf: 'Purchase Order'}
		end
	end

	private

	def time_params
		#params.permit(:from_time, :from_ampm, :to_time, :to_ampm)!
	end

	def purchase_order_params
		# if params[:purchase][:purchase_date].present?
		# 	params[:purchase][:purchase_date] = Date.strptime(params[:purchase][:purchase_date], "%m/%d/%Y").to_s
		# end
		if current_user.role.role_level == 'branch'
			params.require(:purchase_order).permit(:client_id, :brand_id, :branch_id, :po_date, :pr_date, :pr_number, :po_number, :remarks, :terms, :status, :supplier_id, :po_reference)
		else
			params.require(:purchase_order).permit(:client_id, :brand_id, :branch_id, :po_date, :pr_date, :pr_number, :po_number, :remarks, :terms, :status, :supplier_id, :po_reference, :delivery_time, :delivery_date)			
		end
	end

	def per_page
		params[:show].eql?('all') ? PurchaseOrder.count : params[:show]
		return 10 if params[:show].nil?
	end
end
