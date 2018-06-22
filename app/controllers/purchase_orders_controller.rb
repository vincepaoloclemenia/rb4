class PurchaseOrdersController < ApplicationController
	include PurchaseOrderHelper
	before_action :authenticate_user!
	before_action :access_control
	before_action :restrict_branch_admins, only: [:create], if: :branch_admin?
	before_action :set_ids_and_supplier, only: [:edit_delivery_details, :send_bulk_purchase_orders, :update_delivery_details]

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
		if branch_admin?
			@purchase_order = current_user.branch.purchase_orders.build(purchase_order_params)
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
			@purchase_order = current_client.purchase_orders.build(purchase_order_params)
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

	def edit_delivery_details
		@purchase_order = PurchaseOrder.find params[:purchase_order_id]
	end

	def update_delivery_details
		@purchase_order = PurchaseOrder.find params[:purchase_order_id]
		po = params[:purchase_order]
		date = Date.strptime(po[:delivery_date], "%m/%d/%Y")
		@purchase_order.update(delivery_date: date, delivery_time: po[:delivery_time])
		respond_to do |format|
			if @purchase_order.save
				send_bulk_purchase_orders
				@success = true
				flash[:notice] = "Delivery details successfully updated"
			else
				@success = false
				flash[:alert] = @purchase_order.errors.full_messages.join(", ")
			end
			format.js
		end
	end

	def hold_po
		@purchase_order = PurchaseOrder.find params[:purchase_order_id]
	end

	def hold
		if params[:purchase_order_id] && params[:hold][:note].present?
			h = params[:hold]
			@purchase_order = PurchaseOrder.find(params[:purchase_order_id])
			@purchase_order.update(status: 'On Hold', note: h[:note] )
			if @purchase_order.save
				redirect_to purchase_orders_path, notice: "#{@purchase_order.branch.name} purchase order was marked 'On Hold' "
			else
				redirect_to purchase_orders_path, alert: @purchase_order.errors.full_messages.join(', ')
			end
		else
			redirect_to purchase_orders_path, alert: "Missing parameters. Action cannot be completed."			
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
		@subject = po[:subject]
		@person = po[:contact_person]
		@recipients = po[:recipients]
		@title = po[:contact_title]
		@message = po[:body]
		@from = po[:from]
		
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
		po = params[:po_email]
		@subject = po[:subject]
		@supplier = Supplier.find(params[:supplier])	
		@recipients = po[:recipients].select { |x| x.present? }
		@pos = current_brand.purchase_orders.where(id: params[:purchase_orders])
		if @subject == '' || @recipients.empty? || @pos.map { |x| x.valid_time? && x.valid_date? }.include?(false)
			redirect_to purchase_orders_path, alert: "Incomplete information. Sending of email cannot be completed."
		else
			@pos = current_brand.purchase_orders.where(id: params[:purchase_orders])
			@pos.map { |purchase_order| purchase_order.update( po_date: Date.today, po_number: po_approval_format(purchase_order) ) }
			@purchase_orders = @pos.group_by { |pur| pur.branch.name }
			@contact = params[:po_email][:contact_person]
			@address = params[:po_email][:delivery_address]
			@message = params[:po_email][:body]
			@brand = current_brand
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
		@contact_person = @supplier.contact_person
		@contact_title = @supplier.contact_title
		@subject = "PO - #{current_brand.name.gsub(/\//, '').split.map(&:first).join.upcase} - #{@supplier.name} - #{Date.today.strftime('%B %-d')}"		
		@purchase_orders = current_brand.purchase_orders.find(@ids).group_by { |pur| pur.branch.name }
		@pos_without_date = current_brand.purchase_orders.where( branch_id: @supplier.id ).no_delivery_date
	end

	private

		def purchase_order_params
			params.require(:purchase_order).permit(:client_id, :brand_id, :branch_id, :po_date, :pr_date, :pr_number, :po_number, :remarks, :terms, :status, :supplier_id, :po_reference, :delivery_time, :delivery_date)						
		end

		def set_ids_and_supplier
			@ids = params[:purchases]
			@supplier = Supplier.find params[:supplier_id]
		end

		def restrict_branch_admins
			if current_brand.brand_setting.present? && current_brand.brand_setting.send_pos?
				setting = current_brand.brand_setting.purchase_order_schedule[Date.today.wday]
				if !eval(setting["allowed"])
					flash[:alert] = "You are currently not allowed to submit Purchase Order due to schedule created by your Admin."
					redirect_to dashboard_path
				else
					if Time.now < setting["from"].to_time || Time.now > setting["to"].to_time
						flash[:alert] = "The allowed schedule for you to submit your purchase order today is from #{setting["from"].to_time.strftime("%l:%M %P")} - #{setting["to"].to_time.strftime("%l:%M %P")}"
						redirect_to dashboard_path
					end
				end
			end
		end

		def per_page
			params[:show].eql?('all') ? PurchaseOrder.count : params[:show]
			return 10 if params[:show].nil?
		end
end
