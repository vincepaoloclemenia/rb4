class PurchaseOrdersController < ApplicationController
	# before_action :authenticate_user!
	# before_action :access_control

	def index
		@purchase_order = PurchaseOrder.paginate(page: params[:page], per_page: per_page)
		@purchase_order = PurchaseOrder.new
		# @suppliers = (Supplier.pluck(:name,:id) + SUpplier.pluck(:name,:id)).uniq
	end

	def create
		@purchase_order = PurchaseOrder.new(purchase_params)
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

	# def update
	# 	@purchase_order = current_brand.purchases.find(params[:id])
	# 	respond_to do |format|
	# 		if @purchase_order.update(purchase_params)
	# 			@purchase_order.update(user_modified_by_id: current_user.id)
	# 			index
	# 			@success = true
	# 			flash[:notice] = "Purchase successfully updated"
	# 		else
	# 			@success = false
	# 			flash[:alert] = @purchase_order.errors.full_messages.join(", ")
	# 		end
	# 		format.js
	# 	end
	# 	#redirect_to purchases_path
	# end

	# def destroy
	# 	@purchase_order = current_brand.purchases.find(params[:id])
	# 	respond_to do |format|
	# 		if @purchase_order.destroy
	# 			index
	# 			@success = true
	# 			flash[:notice] = "Purchase successfully deleted"
	# 		else
	# 			@success = false
	# 			flash[:alert] = @purchase_order.errors.full_messages.join(", ")
	# 		end
	# 		format.js
	# 	end
	# 	#redirect_to purchases_path, notice: "Purchase successfully deleted"
	# end

	private

	def purchase_params
		if params[:purchase][:purchase_date].present?
			params[:purchase][:purchase_date] = Date.strptime(params[:purchase][:purchase_date], "%m/%d/%Y").to_s
		end
		params.require(:purchase_order).permit(:client_id, :brand_id, :branch_id, :po_date, :pr_date, :po_number, :po_number, :remarks, :terms, :status, :supplier_id)
	end

	def per_page
		params[:show].eql?('all') ? current_brand.purchases.count : params[:show]
		return 10 if params[:show].nil?
	end
end
