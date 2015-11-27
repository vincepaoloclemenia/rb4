class ItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		@items = current_brand.items
		@item = current_brand.items.new
		@item_types = [['Inventory', 'Inventory'], ['Non-Inventory', 'Non-Inventory'], ['Prepared', 'Prepared']]
	end

	def create
		@item = current_brand.items.new(item_params)
		if @item.save
			redirect_to items_path, notice: "Item successfully created"
		else
			redirect_to items_path, alert: @item.errors.full_messages.join(", ")
		end
	end

	def update
		@item = current_brand.items.find(params[:id])
		if @item.update(item_params)
			redirect_to items_path, notice: "Item successfully updated"
		else
			redirect_to items_path, alert: @item.errors.full_messages.join(", ")
		end
	end

	def destroy
		@item = current_brand.items.find(params[:id])
		@item.destroy
		redirect_to items_path, notice: "Item successfully deleted"
	end

	private

	def item_params
		params.require(:item).permit(:category_id, :unit_id, :name, :item_type, :item_code, :item_value)
	end
end