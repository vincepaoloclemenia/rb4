class ItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		@items = current_brand.items.paginate(page: params[:page], per_page: per_page)
		@items = if params[:search]
			current_brand.items.search(params[:search]).paginate(page: params[:page], per_page: per_page)
		  else
			current_brand.items.paginate(page: params[:page], per_page: per_page)
		end
	end

	def new
		@item = current_brand.items.new
		@item_types = [['Inventory', 'Inventory'], ['Non-Inventory', 'Non-Inventory'], ['Prepared', 'Prepared']]	
		@suppliers = current_client.suppliers.pluck(:name, :id).uniq
	end

	def edit
		@item = current_brand.items.find(params[:id])
		@item_types = [['Inventory', 'Inventory'], ['Non-Inventory', 'Non-Inventory'], ['Prepared', 'Prepared']]
		@suppliers = current_client.suppliers.pluck(:name, :id).uniq
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
		params.require(:item).permit(:category_id, :unit_id, :name, :item_type, :item_code, :item_value, :track_as_sales, :is_active, supplier_ids: [])
	end

	def per_page
		return 10 if params[:show].blank?
		params[:show].eql?('all') ? current_brand.units.not_deleted.count : params[:show]
	end
end