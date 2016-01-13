class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		# @sale = Sale.update_customer_count
		@branches = current_brand.branches.order(:id)
		@update_customer_count = update_customer_count(@branches)
		@price_movement = price_movement_dashboard
		# Sale.save_customer_count_to_dashboard
	end

	def update_customer_count(branches)
		arr = Array.new
		@branches.each do |branch|
			a = Sale.update_customer_count(branch)
			arr.append(a)
		end

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(text: "Customer Count")
		  f.subtitle(text: current_brand.name)
		  f.xAxis(categories: @branches.pluck(:name))
		  f.series(showInLegend: false, name: 'Customer Count', data: arr, colors: @branches.pluck(:color))
			f.chart({defaultSeriesType: "bar"})
			f.plotOptions(bar: {
				colorByPoint: true
				})
		end
	end

	def price_movement_dashboard
		@categories = Category.where(brand_id: current_brand)
		@item_ids = Item.select(:id).where(category_id: @categories.pluck(:id))
		lowest_price_movement = get_lowest_price_movement(@item_ids)
		# return lowest_price_movement
		# lowest_price_movement(@purchase_items)
	end

	def get_lowest_price_movement(item_ids)
		price_movement = Array.new
		item_ids.each do |item_id|
			purchased_items = get_purchased_items(item_id)
			price_movement = price_movement + get_price_movement(purchased_items)
		end
		price_movement = price_movement.sort_by{ |a| a[:price_movement].to_i}

		return (price_movement.delete_if { |a| a[:price_movement].to_i == 0}).first(5)
	end

	def get_price_movement(purchased_items)
		past_price = Array.new
		current_price = purchased_items
		price_movement_values = Array.new
		hash = Hash.new
			
		current_price.each_with_index do |a, index|
			if past_price.empty?
				past_price.append(0)
			else
				past_price.append(current_price[index-1])
			end
			if past_price[index] != 0
				a = current_price[index]
				price_movement_value = past_price[index].purchase_item_amount - current_price[index].purchase_item_amount
				hash = { :branch_name => a.purchase.branch.name, :item => a.item.name, :prev_amount => past_price[index].purchase_item_amount.to_i, :present_amount => a.purchase_item_amount.to_i, :price_movement => price_movement_value }
      end
      price_movement_values.append(hash)
		end

		return price_movement_values
	end

	def get_purchased_items(item_id)
		@date_range = Date.today.beginning_of_month..Date.today
		@purchase_ids = Purchase.select(:id).where(purchase_date: @date_range, brand_id: current_brand)
		@purchase_items = PurchaseItem.where(purchase_id: @purchase_ids, item_id: item_id).order('purchase_item_amount ASC')
		return @purchase_items
	end




end
