class BillsController < ApplicationController
	before_action :authenticate_user!

	def index
		@bills = current_client.bills.order('created_at DESC')
	end
end