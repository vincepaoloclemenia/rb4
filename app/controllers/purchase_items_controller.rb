class PurchaseItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		@purchase = current_brand.purchases.find(params[:purchase_id])
		@purchase_items = @purchase.purchase_items
		@purchase_item = PurchaseItem.new
	end

	def create
		purchase = current_brand.purchases.find(params[:purchase_id])
		@purchase_item = purchase.purchase_items.new(purchase_item_params)
		if @purchase_item.save
			flash[:notice] = "Purchase Item successfully added"
		else
			flash[:alert] = @purchase_item.errors.full_messages.join(", ")
		end
		redirect_to purchase_purchase_items_path(purchase_id: purchase.id)
	end

	def destroy
		purchase = current_brand.purchases.find(params[:purchase_id])
		@purchase_item = purchase.purchase_items.find(params[:id])
		@purchase_item.destroy
		redirect_to purchase_purchase_items_path(purchase_id: purchase.id), notice: "Purchase Item successfully deleted"
	end

	private

	def purchase_item_params
		params.require(:purchase_item).permit(:item_id, :unit_id, :quantity, :purchase_item_amount, :purchase_item_total_amount, :vat_type, 
																				:remarks)
	end
end