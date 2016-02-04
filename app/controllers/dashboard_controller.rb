class DashboardController < ApplicationController
	before_action :authenticate_user!

	include ReportsHelper

	def index
		# Dashboard.populate_dashboard
		@range_date = (Date.today - 7)..(Date.today - 1)
		@branches = current_brand.branches.order(:id)
		@sales_per_branch_total = Array.new
		@branches_sales = branches_sales
		@brand_sales = brand_sales
		@update_customer_count = update_customer_count(@branches)
		@price_movement = price_movement_dashboard
		@branch_cost_stat = branch_purchase_cost_stat
		@purchase_cost_stat = purchase_cost_stat
	end


	def update_customer_count(branches)
		customer_count = Array.new
		@branches.each_with_index do |branch, index|
			dashboard_item = Dashboard.get_dashboard_items((Date.today - 1), branch.id, current_brand.id).first
			dashboard_item.blank? ? customer_count[index] = 0 : customer_count[index] = Dashboard.customer_count_check(dashboard_item.customer_count)
		end
		# arr = Array.new
		# @branches.each_with_index do |branch, index|
		# 	hash = Hash.new
		# 	customer_count = Dashboard.select(:id, :customer_count, :created_at).order('created_at DESC').where(branch_id: branch.id, previous_date_entry: Date.today - 1).last
		# 	customer_count.nil? ? customer_count = 0 : customer_count = customer_count.customer_count
		# 	hash[:name] = branch.name
		# 	hash[:y] = customer_count
		# 	# arr.append(customer_count)
		# 	arr[index] = hash
		# end
		a = ""
		customer_count.map{|x| x == 0 ? a = "bar" : a = "pie"}
		create_chart(current_brand.name, "Branches", @branches.pluck(:name), customer_count, " ", a, @branches.pluck(:color))
	end

	def price_movement_dashboard
		@date_range = Date.today.beginning_of_month..Date.today
		@categories = Category.where(brand_id: current_brand)
		@item_ids = Item.select(:id).where(category_id: @categories.pluck(:id))
		lowest_price_movement = get_price_movement_items(@item_ids, @date_range)
		lowest_price_movement.delete_if { |a| a[:price_movement].to_i == 0}
		return lowest_price_movement.first(5)
	end

	#Purchase Table
	def purchase_cost_stat
		dates = Array.new amount = Array.new
		start_date = Date.today - 7
		@purchase_cost = Dashboard.where(previous_date_entry: @range_date, brand_id: current_brand).order('previous_date_entry ASC')
 		
 		@range_date.each_with_index do |range_date, index|
 			@total_amount = 0
 			@purchase_cost.each do |pc|
 				if pc.previous_date_entry == range_date 
 					@total_amount += pc.purchase_total_amount.to_i
 				end
 			end
 			dates[index] = range_date.strftime("%b %d,%Y | %a")
 			amount[index] = @total_amount
 		end

 		create_chart(current_brand.name, "Brand", dates, amount, "Total Purchase", "line", '')
	end

	def branch_purchase_cost_stat
		total_purchase = Array.new
		current_brand.branches.each_with_index do |branch, index|
			amount = Array.new
			@range_date.each_with_index do |date, index|
				dashboard_item = Dashboard.get_dashboard_items(date, branch.id, current_brand.id).first
				dashboard_item.blank? ? amount[index] = 0 : amount[index] = dashboard_item.purchase_total_amount
			end
			total_purchase[index] = amount
		end

	 	create_chart(current_brand.name, "Branches", @range_date.map{|a| a.strftime("%b %d,%Y | %a")}, total_purchase, @branches.pluck(:name), "line",  @branches.pluck(:color))
	end

	#Sales Table
 	def branches_sales
 		range_date = (Date.today - 7)..(Date.today - 1)
 		sales_total_amount = Array.new
 		current_brand.branches.each_with_index do |branch, index|
 			amount = Array.new
 			range_date.each_with_index do |date, index|
 				dashboard = Dashboard.where(previous_date_entry: date, branch_id: branch.id, brand_id: current_brand.id).first
 				if dashboard.nil?
 					amount[index] = 0
 				else
 					amount[index] = dashboard.sales_total_amount.to_i
 				end
 			end
 			sales_total_amount[index] = amount
 		end
 		@sales_per_branch_total = sales_total_amount
 		create_chart(current_brand.name, "Branches", range_date.map{|a| a.strftime("%b %d, %Y | %a")}, sales_total_amount, @branches.pluck(:name), "column", @branches.pluck(:color))
 	end

 	def brand_sales
 		range_date = (Date.today - 7)..(Date.today - 1)
 		brand_total_sale = @sales_per_branch_total.transpose.map{|x| x.reduce(:+)}
 		create_chart(current_brand.name, "Brand", range_date.map{|a| a.strftime("%b %d, %Y | %a")}, brand_total_sale, "Total Amount", "column", @branches.pluck(:color))
 	end
 		
	def create_chart(title, subtitle, categories, data, names, chartType, colors)
	  LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(text: title)
		  f.subtitle(text: subtitle)
		  f.xAxis(categories: categories)
		  if names.instance_of? Array
			  data.each_with_index do |d, index|
		  		f.series(showInLegend: false, name: names[index], data: d, colors: colors)
		  	end
		  else
		  	f.series(showInLegend: false, name: names, data: data, colors: colors)
		  end
			f.chart({defaultSeriesType: chartType})
			f.plotOptions(bar: {
					colorByPoint: true,
					colors: colors
				},
				pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: false
          },
          showInLegend: true
      })
		end
	end

end