class BillsController < ApplicationController
	before_action :authenticate_user!

	def index
		@bills = current_client.bills
	end
end