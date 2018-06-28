class PurchasesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :restrict_actions, only: [:update, :destroy]
	before_action :restrict_other_users, only: :purchase_order_lookup

	def index
		get_total_purchases_per_branch
		@q = current_brand.purchases.ransack(params[:q])
		@purchases = if current_user.role.role_level.eql?('branch')
						current_user.branch.purchases.paginate(page: params[:page], per_page: per_page)
					else
						current_brand.purchases.paginate(page: params[:page], per_page: per_page)
					end
		@purchase = current_brand.purchases.new
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
	end

	def show
	end

	def get_total_purchases_per_branch
		d = Date.today - 1 
		purchase_array = Array.new

		current_brand.branches.each_with_index do |branch, index|
			hash = Hash.new
			hash[:brand_name] = branch.name
			@branch_purchases = Purchase.where(branch_id: branch, brand_id: current_brand, purchase_date: d)
			hash[:total_purchases_amount] = get_total_purchases(@branch_purchases)
			purchase_array[index] = hash
		end
		return purchase_array
	end

	def get_total_purchases(purchases)
		total_amount = 0
		purchases.each do |purchase|
			purchase.purchase_items.each do |pi|
				total_amount += pi.purchase_item_total_amount
			end
		end
		return total_amount
	end

	def new
		@purchase = current_brand.purchases.new
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq		
		@purchase_orders = current_user.branch.sent_approved_purchased_orders.select :po_number, :id if branch_admin?
	end

	def edit
		@purchase = current_brand.purchases.find params[:id]
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq				
	end

	def create
		@purchase = current_brand.purchases.create(purchase_params)
		@purchase.user_created_by_id = current_user.id
		if @purchase.save
			redirect_to purchase_purchase_items_path(@purchase.id)
			flash[:notice] = "Purchase was successfully created"
		else
			redirect_to purchases_path
			flash[:alert] = @purchase.errors.full_messages.join(', ')
		end
	end

	def update	
		if @purchase.update(purchase_params)
			redirect_to purchases_path
			flash[:notice] = "Purchase was successfully updated"
		else
			redirect_to purchases_path
			flash[:alert] = @purchase.errors.full_messages.join(', ')
		end
		
		#redirect_to purchases_path
	end

	def destroy	
		if @purchase.purchase_order.present?
			@purchase_order = @purchase.purchase_order
			@purchase_order.update(saved_as_purchase: false)
		end
		respond_to do |format|
			if @purchase.destroy
				index
				@success = true
				flash[:notice] = "Purchase successfully deleted"
			else
				@success = false
				flash[:alert] = @purchase.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchases_path, notice: "Purchase successfully deleted"
	end

	def purchase_order_lookup
	end

	def purchase_new_record
		@purchase_order = PurchaseOrder.find_by_id params[:purchase_order_id]
		@purchase = @purchase_order.branch.purchases.new
	end

	def purchase_create
		@branch = Branch.find params[:branch_id]
		@purchase = @branch.purchases.build(purchase_params)
		@purchase_order = PurchaseOrder.find params[:purchase_order_id]
		@purchase.saved_through_po = true
		@purchase.user_created_by_id = current_user.id
		if @purchase.save
			@purchase_order.update(saved_as_purchase: true)
			redirect_to purchase_order_lookup_purchases_path(purchase_order_id: params[:purchase_order_id], purchase: @purchase.id), notice: "Purchase through purchase order has been successfully created. You may now add purchase items" 
		else
			redirect_to purchases_path, alert: "Oops!, #{@purchase.errors.full_messages.join(', ')}"
		end
	end

	def add_purchase_item
		@purchase = current_brand.purchases.find params[:purchase_id]
		@purchase_order = PurchaseOrder.find params[:purchase_order_id]
		@purchase_order_item = PurchaseOrderItem.find params[:purchase_order_item_id]
		@purchase_item = @purchase.purchase_items.new
	end

	def create_purchase_items
		@purchase = Purchase.find(params[:purchase])
		@purchase_order = PurchaseOrder.find_by_id params[:purchase_order_id]
		@purchase_item = @purchase.purchase_items.new(purchase_item_params)
		@purchase_item.date_of_purchase = @purchase.purchase_date
		respond_to do |format|
			if @purchase_item.save
				if current_user.role.role_level.eql?('branch')
					current_brand.activities.create(
						user_id: current_user.id,
						action: " purchased #{@purchase_item.quantity.to_i} #{@purchase_item.unit_name.pluralize(@purchase_item.quantity.to_i).downcase} of #{@purchase_item.item.name}",
						recordable: @purchase_item
					)
				else
					current_brand.activities.create(
						user_id: current_user.id,
						action: " purchased #{@purchase_item.quantity.to_i} #{@purchase_item.unit_name.pluralize(@purchase_item.quantity.to_i).downcase} of #{@purchase_item.item.name} for #{@purchase_item.branch.name}",
						recordable: @purchase_item
					)
				end
				purchase_order_lookup
				@success = true
				flash[:notice] = "Purchase Item successfully added"
			else
				purchase_order_lookup
				@success = false
				flash[:alert] = @purchase_item.errors.full_messages.join(", ")
			end
			format.js
		end
	end

	private

		def purchase_params
			if params[:purchase][:purchase_date].present?
				params[:purchase][:purchase_date] = Date.strptime(params[:purchase][:purchase_date], "%m/%d/%Y").to_s
			end
			params.require(:purchase).permit(:brand_id, :branch_id, :client_id, :purchase_date, :invoice_number, :supplier_id, :purchase_order_id)
		end

		def per_page
			params[:show].eql?('all') ? current_brand.purchases.count : params[:show]
			return 10 if params[:show].nil?
		end

		def purchase_item_params
			params.require(:purchase_item).permit(
				:purchase_order_item_id, 
				:item_id, 
				:unit_name, 
				:quantity, 
				:purchase_item_amount, 
				:purchase_item_total_amount, 
				:vat_type, 
				:remarks, 
				:date_of_purchase, 
				:packaging
			)
		end

		def restrict_actions
			@purchase = current_brand.purchases.find(params[:id])
			if branch_admin? && @purchase.unable_to_modify?
				redirect_to purchases_path
				flash[:alert] = "Unable to delete or edit. You can only do these actions within 12 hours after creation"
			end
		end

		def restrict_other_users
			@purchase_order = current_brand.purchase_orders.find_by_id params[:purchase_order_id]
			@purchase = Purchase.find_by_id params[:purchase]
			redirect_to purchases_path, alert: "No record found" unless @purchase_order && @purchase
		end	
end