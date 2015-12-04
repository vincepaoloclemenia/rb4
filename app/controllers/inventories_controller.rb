class InventoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_inventory, only: [:show, :edit, :update, :destroy]

	def index
		@inventories = current_brand.inventories

		# respond_to do |format|
		# 	format.pdf do
		# 		branch = current_brand.branches.find(params[:branch_id])

		# 		items = if params[:category_id].nil?
		# 							current_brand.items.for_inventory
		# 						else
		# 							current_brand.items.for_inventory.where(category_id: params[:category_id])
		# 						end

		# 		pdf = InventoryPdf.new(items, current_brand, branch)
		# 		send_data pdf.render, filename: "Inventory_Item_List_#{Date.today.to_s}.pdf",
		# 													disposition: "inline"
		# 	end
		# 	format.html
		# end
		respond_to do |format|
			format.html
			format.pdf do
				@branch = current_brand.branches.find(params[:branch_id])
				@categories = current_brand.categories.main
				@subcategories = current_brand.categories.where.not(parent_id: nil)
				if params[:subcategory_id].nil? || params[:subcategory_id].empty?
					@subcategory_ids = @subcategories.pluck(:id)
				else
					@subcategory_ids = params[:subcategory_id].map {|id| id.to_i }
				end
				render pdf: "Inventory Item List",
							orientation: "Portrait",
							page_width: "13in",
							margin: { top: 1, bottom: 1 }
			end
		end
	end

	def new
		@inventory = current_brand.inventories.new()
		@inventory.inventory_items.build
	end

	def create
		@inventory = current_brand.inventories.new(inventory_params)
		if @inventory.save
			redirect_to inventories_path, notice: "Inventory successfully created"
		else
			# flash[:alert] = @inventory.errors.full_messages.join(", ")
			# render 'new'
			redirect_to new_inventory_path, alert: @inventory.errors.full_messages.join(", ")
		end
	end

	def edit
	end

	def update
		if @inventory.update(inventory_params)
			redirect_to inventories_path, notice: "Inventory successfully updated"
		else
			# flash[:alert] = @inventory.errors.full_messages.join(", ")
			# render 'edit'
			redirect_to edit_inventory_path(@inventory), alert: @inventory.errors.full_messages.join(", ")
		end
	end

	def destroy
		@inventory.destroy
		redirect_to inventories_path, notice: "Inventory successfully deleted"
	end

	private

	def set_inventory
		@inventory = current_brand.inventories.find(params[:id])
	end

	def inventory_params
		params[:inventory][:entry_date] = Date.strptime(params[:inventory][:entry_date], "%m/%d/%Y").to_s unless params[:inventory][:entry_date].blank?
		params.require(:inventory).permit(:branch_id, :user_id, :entry_date, inventory_items_attributes: [:id, :inventory_id, :item_id, :stock_count])
	end
end