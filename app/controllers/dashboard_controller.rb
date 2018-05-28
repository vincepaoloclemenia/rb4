class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	include ReportsHelper

	def index
		@range_date = (Date.today - 7)..(Date.today - 1)
		@formatted_dates = @range_date.map{|d| d.strftime("%b %d, %Y | %a")}
		@colours = current_brand.branches.all.map { |b| b.color }
		@branches = current_brand.branches.order(:id)		
		#Tables/Modules
		@branches_sales = branches_sales
		@brand_sales = brand_sales
		@update_customer_count = update_customer_count(@branches)
		@price_movement = price_movement_dashboard
		@branch_purchases = branch_purchases
		@brand_purchases = brand_purchases
	end

	def get_dashboard_items(date_range, brand, module_type)
		purchases_total_amount = Array.new
 		brand.branches.each_with_index do |branch, index|
 			purchases_total_amount[index]= Dashboard.get_array_dashboard_values(date_range, brand, branch, module_type)
 		end
 		return purchases_total_amount
	end

	def update_customer_count(branches)
		customer_count = Array.new
		date = Date.today - 1
		@branches.each_with_index do |branch, index|
			dashboard_item = Dashboard.get_dashboard_items(date, branch.id, current_brand.id)
			dashboard_item.blank? ? customer_count[index] = 0 : customer_count[index] = Dashboard.check_value(dashboard_item.customer_count)
		end
		create_chart(current_brand.name, date.strftime("%b %d, %Y | %a"), @branches.pluck(:name), customer_count, "Total Purchase", "line", '')
	end

	def price_movement_dashboard
		@date_range = Date.today.beginning_of_month..Date.today
		@categories = Category.where(brand_id: current_brand)
		@item_ids = Item.select(:id).where(category_id: @categories.pluck(:id))
		lowest_price_movement = get_price_movement_items(@item_ids, @date_range)
		lowest_price_movement.delete_if { |a| a[:price_movement].to_i == 0}
		return lowest_price_movement.first(5)
	end

	#Purchases
	def brand_purchases 
 		purchase_total_amount = get_dashboard_items(@range_date, current_brand, 'purchases')
 		total = purchase_total_amount.transpose.map{|a| a.reduce(:+)}
 		create_chart(current_brand.name, "Brand", @formatted_dates, total, "Total Purchase", "line", @branches.pluck(:color))
	end

	def branch_purchases
		purchase_total_amount = get_dashboard_items(@range_date, current_brand, 'purchases')
		create_chart(current_brand.name, "Branches", @formatted_dates,	purchase_total_amount, @branches.pluck(:name), "line",  @branches.pluck(:color))
	end

	#Sales
 	def branches_sales
 		sales_total_amount = get_dashboard_items(@range_date, current_brand, 'sales')
 		create_chart(current_brand.name, "Branches", @formatted_dates, sales_total_amount, @branches.pluck(:name), "column", @branches.pluck(:color))
 	end

 	def brand_sales
 		sales_total_amount = get_dashboard_items(@range_date, current_brand, 'sales')
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