class DashboardController < ApplicationController
	before_action :authenticate_user!

	include ReportsHelper

	def index
		Dashboard.populate_dashboard
		@branches = current_brand.branches.order(:id)
		@update_customer_count = update_customer_count(@branches)
		@price_movement = price_movement_dashboard
		@branch_cost_stat = branch_purchase_cost_stat
		@purchase_cost_stat = purchase_cost_stat
	end

	def update_customer_count(branches)
		arr = Array.new
		@branches.each_with_index do |branch, index|
			hash = Hash.new
			customer_count = Dashboard.select(:id, :customer_count, :created_at).order('created_at DESC').where(branch_id: branch.id, previous_date_entry: Date.today - 1).last
			customer_count.nil? ? customer_count = 0 : customer_count = customer_count.customer_count
			hash[:name] = branch.name
			hash[:y] = customer_count
			# arr.append(customer_count)
			arr[index] = hash
		end

	# raise 
		create_chart(current_brand.name, "Brand", @branches.pluck(:name), arr, " ", "pie", @branches.pluck(:color))
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
		dates = Array.new amount = Array.new
		start_date = Date.today - 7
		range_dates = start_date..Date.today
 		@purchase_cost = Dashboard.where(previous_date_entry: range_dates, brand_id: current_brand).order('previous_date_entry ASC')
 		
 		range_dates.each_with_index do |range_date, index|
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
		branches = Array.new total_purchases = Array.new
		dates = Array.new 
		start_date = Date.today - 7 
		range_dates = start_date..Date.today
 		@purchase_cost = Dashboard.where(previous_date_entry: range_dates, brand_id: current_brand).order('previous_date_entry ASC')

 		current_brand.branches.each_with_index do |branch, index|
 			total_day_amount = Array.new
 			range_dates.each_with_index do |range_date, index|
 					@purchases = @purchase_cost.where(branch_id: branch.id, previous_date_entry: range_date)
		 			@total_amount = 0
		 			@purchases.each do |p|
		 				@total_amount += p.purchase_total_amount.to_i
		 			end
		 			total_day_amount[index] = @total_amount
		 	end
		 	total_purchases[index] = total_day_amount
 		end
	 	create_chart(current_brand.name, "Branches", range_dates.map{|a| a.strftime("%b %d,%Y | %a")}, total_purchases, @branches.pluck(:name), "line",  @branches.pluck(:color))
 	end
 		
	def create_chart(title, subtitle, categories, data, names, chartType, colors)
	  LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(text: title)
		  f.subtitle(text: subtitle)
		  # raise
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