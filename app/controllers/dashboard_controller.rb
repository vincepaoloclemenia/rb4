class DashboardController < ApplicationController
	before_action :authenticate_user!

	# ActionView::Helpers::NumberHelper, 
	include ReportsHelper, ApplicationHelper

	def index
		# @sale = Sale.update_customer_count
		@branches = current_brand.branches.order(:id)
		@update_customer_count = update_customer_count(@branches)
		@price_movement = price_movement_dashboard
		@purchase_cost_stat = purchase_cost_stat
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
		@date_range = Date.today.beginning_of_month..Date.today
		lowest_price_movement = get_price_movement_items(@item_ids, @date_range)
		lowest_price_movement.delete_if { |a| a[:price_movement].to_i == 0}
		
		return lowest_price_movement.first(5)
	end

	def purchase_cost_stat
		total_purchase = Array.new purchase_dates = Array.new
		@purchase = Purchase.where(purchase_date: [DateTime.now - 7.days..DateTime.now], brand_id: current_brand)
		@purchase.each_with_index do |p, index|
			purchase_item_total = 0 
			p.purchase_items.each do |pi|
				purchase_item_total += pi.purchase_item_amount
			end
			total_purchase[index] = purchase_item_total.to_i
		  purchase_dates[index] = p.purchase_date.to_date.strftime("%B %d, %Y | %a")
		  # Date.strptime(p.purchase_date.to_date, "%m%d%y").to_s

		end	
		create_chart("Purchase Cost Stat", "", purchase_dates, total_purchase, current_brand.name, "line", '')
	end

	def create_chart(title, subtitle, categories, data, name, chartType, colors)
		@purchase_chart = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(text: title)
		  f.subtitle(text: subtitle)
		  f.xAxis(categories: categories)
		  f.series(showInLegend: false, name: name, data: data, colors: colors)
			f.chart({defaultSeriesType: chartType})
			f.plotOptions(bar: {
				colorByPoint: true
				})
		end
	end

	# def purchase_cost_stat
	# 	@purchase_array = []
 #    @purchase = Purchase.where(purchase_date: [DateTime.now - 7.days..DateTime.now], brand_id: current_brand).group_by{ |s| [s.branch.try(:name), s.purchase_date] }
 #    @purchase.each_with_index do |(purchase_group, purchases), index|
 #    	purchase_item_total_amount = 0
 #    	@purchase_array << [purchase_group[1]]
 #    	purchases.each do |p|
 #      	p.purchase_items.each do |pi|
 #      		purchase_item_total_amount += pi.purchase_item_total_amount
 #        end
 #        	total_purchase += purchase_item_total_amount
 #      end
 #    raise
 #      # @purchase_array[index] << purchase_amount_total
 #      # @purchase_array[index] << purchase_group
 #    end
	# end

	# def get_price_movement_items(item_ids)
	# 	price_movement = Array.new
	# 	@date_range = Date.today.beginning_of_month..Date.today
	# 	item_ids.each do |item_id|
	# 		purchased_items = get_purchased_items(item_id, @date_range)
	# 		price_movement = price_movement + get_price_movement(purchased_items)
	# 	end
	# 	price_movement = price_movement.sort_by{ |a| a[:price_movement].to_i}
	# 	return price_movement
	# 	# return (price_movement.delete_if { |a| a[:price_movement].to_i == 0}).first(5)
	# end

	# def get_price_movement(purchased_items)
	# 	past_price = Array.new
	# 	current_price = purchased_items
	# 	price_movement_values = Array.new
	# 	hash = Hash.new
			
	# 	current_price.each_with_index do |a, index|
	# 		if past_price.empty?
	# 			past_price.append(0)
	# 		else
	# 			past_price.append(current_price[index-1])
	# 		end
	# 		if past_price[index] != 0
	# 			a = current_price[index]
	# 			price_movement_value = past_price[index].purchase_item_amount - current_price[index].purchase_item_amount
	# 			hash = { :branch_name => a.purchase.branch.name, :item => a.item.name, :prev_amount => past_price[index].purchase_item_amount.to_i, :present_amount => a.purchase_item_amount.to_i, :price_movement => price_movement_value }
 #      end
 #      price_movement_values.append(hash)
	# 	end

	# 	return price_movement_values
	# end

	# def get_purchased_items(item_id, date_range)
	# 	@purchase_ids = Purchase.select(:id).where(purchase_date: date_range, brand_id: current_brand)
	# 	@purchase_items = PurchaseItem.where(purchase_id: @purchase_ids, item_id: item_id).order('purchase_item_amount ASC')
	# 	return @purchase_items
	# end

end
