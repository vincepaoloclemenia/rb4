class PurchaseItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :find_purchased_item, only: :show

	def index
		@purchase = current_brand.purchases.find(params[:purchase_id])
		@purchase_items = @purchase.purchase_items.paginate(page: params[:page], per_page: per_page)
		@purchase_item = PurchaseItem.new
	end

	def create
		purchase = current_brand.purchases.find(params[:purchase_id])
		@purchase_item = purchase.purchase_items.new(purchase_item_params)
		@purchase_item.date_of_purchase = Date.today
		respond_to do |format|
			if @purchase_item.save
				if current_user.role.role_level.eql?('branch')
					current_brand.activities.create(
						user_id: current_user.id,
						action: " purchased #{@purchase_item.quantity.to_i} #{@purchase_item.unit.name.pluralize(@purchase_item.quantity.to_i).downcase} of #{@purchase_item.item.name}",
						recordable: @purchase_item
					)
				else
					current_brand.activities.create(
						user_id: current_user.id,
						action: " purchased #{@purchase_item.quantity.to_i} #{@purchase_item.unit.name.pluralize(@purchase_item.quantity.to_i).downcase} of #{@purchase_item.item.name} for #{@purchase_item.branch.name}",
						recordable: @purchase_item
					)
				end
				index
				@success = true
				flash[:notice] = "Purchase Item successfully added"
			else
				@success = false
				flash[:alert] = @purchase_item.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchase_purchase_items_path(purchase_id: purchase.id)
	end

	def show
	end

	def destroy
		purchase = current_brand.purchases.find(params[:purchase_id])
		@purchase_item = purchase.purchase_items.find(params[:id])
		respond_to do |format|
			if @purchase_item.destroy
				index
				@success = true
				flash[:notice] = "Purchase item successfully deleted"
			else
				@success = false
				flash[:alert] = @purchase_item.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchase_purchase_items_path(purchase_id: purchase.id), notice: "Purchase Item successfully deleted"
	end

	private

	def per_page
		params[:show].eql?('all') ? current_brand.purchases.count : params[:show]
		return 10 if params[:show].nil?
	end

	def purchase_item_params
		params.require(:purchase_item).permit(:item_id, :unit_id, :quantity, :purchase_item_amount, :purchase_item_total_amount, :vat_type, 
																				:remarks, :date_of_purchase)
	end

	def find_purchased_item
		@purchase_item = current_user.brand.purchase_items.find(params[:id])
	end
end