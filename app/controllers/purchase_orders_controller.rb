class PurchaseOrdersController < ApplicationController
	# before_action :authenticate_user!
	# before_action :access_control

	def index
		@purchase_orders = PurchaseOrder.paginate(page: params[:page], per_page: per_page)
		@purchase_order = PurchaseOrder.new
		@suppliers = (Supplier.pluck(:name,:id) + Supplier.pluck(:name,:id)).uniq
	end

	def create
		@purchase_order = PurchaseOrder.new(purchase_order_params)
		# @purchase_order.user_created_by_id = current_user.id
		respond_to do |format|
			if @purchase_order.save
				index
				@success = true
				flash[:notice] = "Purchase Order successfully created"
			else
				@success = false
				flash[:alert] = @purchase_order.errors.full_messages.join(", ")
			end
			format.js
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
		#redirect_to purchases_path, notice: "Purchase successfully deleted"
	end

	def update_status
  	@purchase_order = PurchaseOrder.find(params[:oli])
  	@purchase_order.status = 'Notified'
  	@purchase_order.save
  	@purchase_order_items = @purchase_order.purchase_order_items.all
  	#create mail notification
  	UserMailer.send_status_notification(@purchase_order, @purchase_order_items).deliver
  	redirect_to purchase_orders_path(), notice: 'Notify the admin about new purchase order.'	
  end

	private

	def purchase_order_params
		# if params[:purchase][:purchase_date].present?
		# 	params[:purchase][:purchase_date] = Date.strptime(params[:purchase][:purchase_date], "%m/%d/%Y").to_s
		# end
		params.require(:purchase_order).permit(:client_id, :brand_id, :branch_id, :po_date, :pr_date, :pr_number, :po_number, :remarks, :terms, :status, :supplier_id)
	end

	def per_page
		params[:show].eql?('all') ? PurchaseOrder.count : params[:show]
		return 10 if params[:show].nil?
	end
end
