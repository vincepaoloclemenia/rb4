class ReportsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def purchase_listings
		@purchases = current_brand.purchases
	end
end