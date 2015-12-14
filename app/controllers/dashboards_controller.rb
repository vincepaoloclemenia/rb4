class DashboardsController < ApplicationController
	before_action :authenticate_user!

	def index
		@sale = update_customer_count
	end

	def update_customer_count
		# return num
		yesterday = Date.today-1
		@sale = Sale.select(:customer_count, :branch_id).where(sale_date: yesterday)
		# @sale = Sale.select(:customer_count, :branch_id).where(branch_id: current_brand)
	end

end
