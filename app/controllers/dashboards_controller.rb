class DashboardsController < ApplicationController
	before_action :authenticate_user!

	def index
		@sale = Sale.update_customer_count
	end
end