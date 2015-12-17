class DashboardsController < ApplicationController
	before_action :authenticate_user!

	def index
		@sale = Sale.update_customer_count
		@branches = current_brand.branches
		@customer_count_array = get_customer_count_array(@branches, @sale)

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(text: "Customer Count")
		  f.xAxis(categories: @branches.pluck(:name))
		  f.series(name: "Customer Count", data: @customer_count_array)
		  f.chart({defaultSeriesType: "bar"})
		end
	end

	def get_customer_count_array(branches, sale) 
	  arr = Array.new
		branches.each do |branch|
			sale.each do |sale|
				if sale.branch_id == branch.id 
					@a = sale.customer_count
				else
					@a = 0
				end
			end
			arr.append(@a)
		end
		return arr
	end

end

