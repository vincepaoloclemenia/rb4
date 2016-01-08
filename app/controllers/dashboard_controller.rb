class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		# @sale = Sale.update_customer_count
		@branches = current_brand.branches.order(:id)
		@update_customer_count = update_customer_count(@branches)
		price_movement_dashboard
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
		  f.xAxis(categories: @branches.pluck(:name))
		  f.series(showInLegend: false, name: 'Customer Count', data: arr, colors: @branches.pluck(:color))
			f.chart({defaultSeriesType: "bar"})
			f.plotOptions(bar: {
				colorByPoint: true
				})
		end
	end

	def price_movement_dashboard
		@date_range = Date.today.beginning_of_month..Date.today
		@branch_ids = current_brand.branches.pluck(:id)
		@purchase_ids = Purchase.where(purchase_date: @date_range, brand_id: current_brand.id, branch_id: @branch_ids)
		@purchase_items = PurchaseItem.where(purchase_id: @purchase_ids)
		@purchase_items.order(:item_id, :id).each do |purchase_item|

		end
	end	
end
