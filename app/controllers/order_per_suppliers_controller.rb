class OrderPerSuppliersController < ApplicationController
	
	def index
		
		
	end

	def index
		@order_list = OrderList.find params[:order_list_id]
		@order_per_suppliers = OrderPerSupplier.paginate(page: params[:page], per_page: per_page)
		@order_per_supplier = OrderPerSupplier.new
	end

	def create
		# @order_list = OrderList.find params[:order_list_id]
		@order_per_supplier = OrderPerSupplier.new(order_per_supplier_params)
		respond_to do |format|
			if @order_per_supplier.save
				index
				@success = true
				flash[:notice] = "Purchase Item successfully added"
			else
				@success = false
				flash[:alert] = @order_per_supplier.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchase_order_per_suppliers_path(purchase_id: purchase.id)
	end

	private

	def order_per_supplier_params
			# if params[:order_list][:order_list_date].present?
			# 	params[:order_list][:order_list_date] = Date.strptime(params[:order_list][:order_list_date], "%m/%d/%Y").to_s
			# end
			params.require(:order_per_supplier).permit(:supplier_id, :item_id, :price_selected, :branch_id, :quantity, :unit, :remarks, :order_list_id)
		end

	def per_page
		params[:show].eql?('all') ? current_brand.order_lists.count : params[:show]
		return 10 if params[:show].nil?
	end
end