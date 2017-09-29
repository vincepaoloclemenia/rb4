class SupplierItemPricesController < ApplicationController
	# before_action :authenticate_user!
	# before_action :access_control

	def index
		@supplier_item_prices = SupplierItemPrice.where(supplier_id: params[:sp])
	end

	def new
		@supplier_item_price = SupplierItemPrice.new
		@items = Item.all
		@sp_id = params[:sp]
	end

	def edit
		@supplier_item_price = SupplierItemPrice.find(params[:id])
	end

	def create
		# raise
		@supplier_item_price = SupplierItemPrice.new(supplier_params)
		if @supplier_item_price.save
			flash[:notice] = "Supplier successfully created"
		else
			flash[:alert] = @supplier_item_price.errors.full_messages.join(", ")
		end
		redirect_to supplier_item_prices_path(sp: supplier_params['supplier_id'])
	end

	def update
		@supplier_item_price = SupplierItemPrice.find(params[:id])
		if @supplier_item_price.update(supplier_params)
			flash[:notice] = "Supplier successfully updated"
		else
			flash[:alert] = @supplier_item_price.errors.full_messages.join(", ")
		end
		redirect_to supplier_item_prices_path
	end

	def destroy
		@supplier_item_price = SupplierItemPrice.find(params[:id])
		@supplier_item_price.destroy
		redirect_to supplier_item_prices_path, notice: "Supplier successfully deleted"
	end

	private

	def supplier_params
		params.require(:supplier_item_price).permit(:supplier_id, :item_id, :supplier_amount, :supplier_item_unit, :packaging)
	end
end