class ReportsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def purchase_listings
		if params[:q]
			if params[:q][:purchase_date_cont].present?
				params[:q][:purchase_date_gteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[0], "%m/%d/%Y").to_s
				params[:q][:purchase_date_lteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[1], "%m/%d/%Y").to_s
				params[:q].delete(:purchase_date_cont)
			end
		end
		@q = current_brand.purchases.ransack(params[:q])
		@purchases = @q.result
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
	end
end