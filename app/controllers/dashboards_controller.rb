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

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
		  # f.title(text: "Customer Count")
		  f.xAxis(categories: @branches.pluck(:name))
		  f.series(name: "Branch 1", data: arr)
			f.series(name: "Branch 2", data: arr)
			f.legend(layout:'horizontal')
			# Legend color should be base on what the branch color the user picks
			f.colors(["#0099CC", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
		  f.chart({defaultSeriesType: "line"})
		end
		return arr
	end

end
