class PurchaseOrdersController < ApplicationController
	include PurchaseOrderHelper
	before_action :authenticate_user!
	before_action :access_control

	def index
		@purchase_orders = current_brand.purchase_orders.unsent_pos.group_by { |po| po.supplier_id }
		@purchase_order = PurchaseOrder.new
		@suppliers = (current_brand.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
	end

	def new
		@purchase_order = current_brand.purchase_orders.new
		@suppliers = (current_brand.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
		if current_user.role.role_level.eql? 'branch'
			@po_number = po_number_format(current_user.branch) 
			@po_ref =  PurchaseOrder.all.present? ? PurchaseOrder.maximum(:id).next : 1 
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
				@purchase_order.update(date_sent: DateTime.now, sent: true)
			end
		end	
		redirect_to purchase_order_generator_index_path, notice: "Your email to #{@purchase_order.supplier.name} has been sent."	
	end

	def mail_bulk_of_purchase_orders
		@pos = current_brand.purchase_orders.where(id: params[:purchase_orders])
		@date = Date.strptime(params[:po_email][:delivery_date], "%m/%d/%Y")
		@time = params[:po_email][:delivery_time]
		@pos.map { |purchase_order| purchase_order.update( po_date: Date.today, po_number: po_approval_format(purchase_order), delivery_time: @time, delivery_date: @date ) }
		@purchase_orders = @pos.group_by { |pur| pur.branch.name }
		@subject = params[:po_email][:subject]
		@contact = params[:po_email][:contact_person]
		@address = params[:po_email][:delivery_address]
		@supplier = Supplier.find(params[:supplier])
		@message = params[:po_email][:body]
		@recipients = params[:po_email][:recipients]
		@brand = current_brand
		if @subject == '' || @date == '' || @time == ''
			redirect_to purchase_order_generator_index_path, alert: "Your mail information was incomplete. Sending Failed"
		else
			@recipients.map do |recipient|
				if recipient == ''
					next
				else
					UserMailer.send_bulk_of_purchase_orders(
						@brand,
						@supplier, 
						@purchase_orders, 
						recipient,
						@address,
						@time,
						@date,
						@contact,
						@subject,
						@message
					).deliver_now
				end
			end	
			redirect_to purchase_order_generator_index_path, notice: "Your email to #{@supplier.name} has been sent."				
			@pos.update_all(date_sent: DateTime.now, sent: true, status: "Approved")
		end	
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

	def group_of_purchase_orders
		@purchase_orders = current_brand.purchase_orders.find(params[:purchases])
		@supplier = Supplier.find params[:supplier]
	end

	def view_po_remotely
		@po = PurchaseOrder.find params[:purchase_order_id]
	end

	def send_bulk_purchase_orders
		@ids = params[:purchases]
		@supplier = Supplier.find params[:supplier_id]
		@contact_person = @supplier.contact_person
		@contact_title = @supplier.contact_title
		@subject = "PO - #{current_brand.name.gsub(/\//, '').split.map(&:first).join.upcase} - #{@supplier.name} - #{Date.today.strftime('%B %-d')}"		
		@purchase_orders = current_brand.purchase_orders.find(params[:purchases]).group_by { |pur| pur.branch.name }
	end

	private

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
