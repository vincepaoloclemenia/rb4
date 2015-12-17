class DashboardsController < ApplicationController
	before_action :authenticate_user!

	def index
		@sale = Sale.update_customer_count
		@branches = current_brand.branches.pluck(:name)
		@chart = LazyHighCharts::HighChart.new('graph') do |f|
		  f.title(text: "Customer Count")
		  f.yAxis(categories: @branches)
		  # f.xAxis(yAxis: @branches, data: [1])
		  f.series(name: "GDP in Billions", yAxis: 0, data: [1])
		  # f.series(name: "Population in Millions", yAxis: 1, data: [310, 127, 1340, 81, 65])

		  # f.xAxis [
		  #   {title: {text: "GDP in Billions", margin: 70} },
		  #   {title: {text: "Population in Millions"}, opposite: true},
		  # ]

		  # f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
		  f.chart({defaultSeriesType: "column"})
		end
	end


end