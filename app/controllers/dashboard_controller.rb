class DashboardController < ApplicationController
	before_action :authenticate_user!

	include ReportsHelper

	def index
		@range_date = (Date.today - 7)..(Date.today - 1)
		@formatted_dates = @range_date.map{|d| d.strftime("%b %d, %Y | %a")}
		@branches = current_brand.branches.order(:id)		
		#Tables/Modules
		@branches_sales = branches_sales
		@brand_sales = brand_sales
		@update_customer_count = update_customer_count(@branches)
		# @price_movement = price_movement_dashboard
		# @branch_cost_stat = branch_purchase_cost_stat
		# @purchase_cost_stat = purchase_cost_stat
	end

	def update_customer_count(branches)
		customer_count = Array.new
		date = Date.today - 1
		@branches.each_with_index do |branch, index|
			dashboard_item = Dashboard.get_dashboard_items(date, branch.id, current_brand.id)
			dashboard_item.blank? ? customer_count[index] = 0 : customer_count[index] = Dashboard.check_if_blank(dashboard_item.customer_count)
			puts "Customer Count #{customer_count[index]}"
		end
		create_chart(current_brand.name, date.strftime("%b %d, %Y | %a"), @branches.pluck(:name), [9,6], "Total Purchase", "line", '')
		# create_chart("Don't Eat Bambi", date.strftime("%b %d, %Y | %a"), @branches.pluck(:name), [9,6], @branches.pluck(:name), "line", @branches.pluck(:color))
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
				dashboard_item = Dashboard.get_dashboard_items(date, branch.id, current_brand.id)
				dashboard_item.nil? ? amount[index] = 0 : amount[index] = Dashboard.check_if_blank(dashboard_item.purchase_total_amount)
			end
			total_purchase[index] = amount
		end
		create_chart(current_brand.name, "Branches", @formatted_dates, total_purchase, @branches.pluck(:name), "line",  @branches.pluck(:color))
	end

	#Sales Table
	def compute_sales_total_amount(date_range, brand, module_type)
		sales_total_amount = Array.new
 		brand.branches.each_with_index do |branch, index|
 			sales_total_amount[index]= Dashboard.get_array_dashboard_values(date_range, brand, branch, module_type)
 		end
 		return sales_total_amount
	end

 	def branches_sales
 		sales_total_amount = compute_sales_total_amount(@range_date, current_brand, 'sales')
 		create_chart(current_brand.name, "Branches", @formatted_dates, sales_total_amount, @branches.pluck(:name), "column", @branches.pluck(:color))
 	end

 	def brand_sales
 		sales_total_amount = compute_sales_total_amount(@range_date, current_brand, 'sales')
 		total = sales_total_amount.transpose.map{|a| a.reduce(:+)}
 		create_chart(current_brand.name, "Brand", @formatted_dates, total, "Total Amount", "column", @branches.pluck(:color))
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
			f.plotOptions(
				bar: {
					colorByPoint: true	
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