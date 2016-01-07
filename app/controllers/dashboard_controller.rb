class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		# @sale = Sale.update_customer_count
		@branches = current_brand.branches.order(:id)
		@update_customer_count = update_customer_count(@branches)

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
		  
		  f.xAxis(name: "hi", categories: @branches.pluck(:name))
		  f.series(name: "Count", data: arr)
			f.chart({defaultSeriesType: "bar"})
			f.color(["#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
		end
	end

	
end
