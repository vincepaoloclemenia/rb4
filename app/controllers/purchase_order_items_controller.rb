class PurchaseOrderItemsController < ApplicationController
	before_action :authenticate_user!
	# before_action :access_control

	def index
		@purchase_order = PurchaseOrder.find(params[:purchase_order_id])
		@po_items =  @purchase_order.purchase_order_items
		@purchase_order_items = @purchase_order.purchase_order_items.paginate(page: params[:page], per_page: per_page)
		@purchase_order_item = PurchaseOrderItem.new
	end

	def new
		@purchase_order = PurchaseOrder.find(params[:purchase_order_id])
		@purchase_order_item = PurchaseOrderItem.new
	end

	def create
		purchase_order = PurchaseOrder.find(params[:purchase_order_id])
		@purchase_order_item = purchase_order.purchase_order_items.new(purchase_order_item_params)
		respond_to do |format|
			if @purchase_order_item.save
				index
				@success = true
				flash[:notice] = "Purchase Item successfully added"
			else
				@success = false
				flash[:alert] = @purchase_order_item.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchase_order_purchase_order_items_path(purchase_order_id: purchase_order.id)
	end

	def destroy
		purchase_order = PurchaseOrder.find(params[:purchase_order_id])
		@purchase_order_item = purchase_order.purchase_order_items.find(params[:id])
		respond_to do |format|
			if @purchase_order_item.destroy
				index
				@success = true
				flash[:notice] = "Purchase order Item successfully deleted"
			else
				@success = false
				flash[:alert] = @purchase_order_item.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchase_order_purchase_order_items_path(purchase_order_id: purchase_order.id), notice: "Purchase Item successfully deleted"
	end

	def send_email
		@po = current_brand.purchase_orders.find(params[:purchase_order_id])
		@email = current_brand.email.nil? ? '' : current_brand.email
		@supplier_emails = []
		@po.supplier.emails.map { |x| @supplier_emails << x }
		@contact_person = @po.supplier.contact_person
		@contact_title = @po.supplier.contact_title
		@subject = "PO - #{current_brand.name.gsub(/\//, '').split.map(&:first).join.upcase} #{@po.branch.aka} - #{@po.supplier.name} - #{Date.today.strftime('%B %-d')}"
	end

	def approve_purchase_order
		@po = current_brand.purchase_orders.find(params[:purchase_order_id])
		@numbers = []
		(1..12).each { |x| @numbers << [ x, x ] }
	end

	private

	def per_page
		params[:show].eql?('all') ? current_brand.purchase_orders.count : params[:show]
		return 10 if params[:show].nil?
	end

	def purchase_order_item_params
		params.require(:purchase_order_item).permit(:item_id, :unit_id, :quantity, :purchase_order_id, :price_selected, :remarks, :total_amount, :packaging)
	end
end
