class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		# @sale = Sale.update_customer_count
		@branches = current_brand.branches.order(:id)
		@update_customer_count = update_customer_count(@branches)
	end

	def update_customer_count(branches)
		arr =Array.new
		@branches.each do |branch|
			a = Sale.update_customer_count(branch)
			arr.append(a)
		end

		@chart = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(text: "Customer Count")
		  f.xAxis(categories: @branches.pluck(:name))
		  f.series(name: "Customer Count", data: arr)
			f.chart({defaultSeriesType: "bar"})
		end
	end

	
end
