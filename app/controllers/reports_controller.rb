class ReportsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def purchase_listings
		@purchases = current_brand.purchases
	end

	#PRICE MOVEMENT REPORT
	def price_movement_report
		@categories = Category.where(brand_id: current_brand)
		if params[:from_date].present?
			@begin_date = Date.strptime(params[:from_date], '%m/%d/%Y')
			@end_date = Date.strptime(params[:to_date], '%m/%d/%Y')
			@date_range = @begin_date..@end_date
			@items = Item.where(category_id: params[:category_id], brand_id: current_brand)
		else
			@date_range = Date.today
		end

		@purchase_ids = Purchase.select(:id).where(purchase_date: @date_range, brand_id: current_brand, branch_id: params[:branch_id])

		@purchase = Purchase.select(:id).where	
		if params[:item_id].present?
			@purchase_items = PurchaseItem.where(item_id: params[:item_id])
		else
			@purchase_items = PurchaseItem.where(purchase_id: @purchase_id)
		end
		# dates = Array.new
		@purchase_items.each do |purchase_item|
			purchase_item.purchase
		end

		Purchase.select(:purchase_date).where(id: )
		previous_price = Array.new
		prices = PurchaseItem.select(:purchase_item_amount).where(item_id: params[:item_id])

		# prices.each do |price|
		# 	previous_price[a] = price.purchase_item_amount.to_i
		# end
	end	

	def  previous_price(range_date)

	end

	def update_item
		@items = Item.where(category_id: params[:category_id])
	end
end