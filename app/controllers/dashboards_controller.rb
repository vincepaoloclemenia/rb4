class DashboardsController < ApplicationController
	before_action :authenticate_user!

	def index
		@sale = Sale.update_customer_count
		@branches = current_brand.branches

	  arr = Array.new
		@branches.each do |branch|
			@sale.each do |sale|
				if sale.branch_id == branch.id 
					@a = sale.customer_count
				else
					@a = 0
				end
			end
			arr.append(@a)
		end

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(text: "Customer Count")
		  f.xAxis(categories: @branches.pluck(:name))
		  f.series(name: "Customer Count", data: arr)
		  f.chart({defaultSeriesType: "bar"})
		end
	end
end

