class PurchasesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		if params[:q]
			if params[:q][:purchase_date_cont].present?
				params[:q][:purchase_date_gteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[0], "%m/%d/%Y").to_s
				params[:q][:purchase_date_lteq] = Date.strptime(params[:q][:purchase_date_cont].split(" - ")[1], "%m/%d/%Y").to_s
				params[:q].delete(:purchase_date_cont)
			end
		end
		@q = current_brand.purchases.ransack(params[:q])
		@purchases = @q.result.paginate(page: params[:page], per_page: per_page)
		@purchase = current_brand.purchases.new
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
	end

	def create
		@purchase = current_brand.purchases.new(purchase_params)
		@purchase.user_created_by_id = current_user.id
		respond_to do |format|
			if @purchase.save
				index
				@success = true
				flash[:notice] = "Purchase successfully created"
			else
				@success = false
				flash[:alert] = @purchase.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchases_path
	end

	def update
		@purchase = current_brand.purchases.find(params[:id])
		respond_to do |format|
			if @purchase.update(purchase_params)
				@purchase.update(user_modified_by_id: current_user.id)
				index
				@success = true
				flash[:notice] = "Purchase successfully updated"
			else
				@success = false
				flash[:alert] = @purchase.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchases_path
	end

	def destroy
		@purchase = current_brand.purchases.find(params[:id])
		respond_to do |format|
			if @purchase.destroy
				index
				@success = true
				flash[:notice] = "Purchase successfully deleted"
			else
				@success = false
				flash[:alert] = @purchase.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchases_path, notice: "Purchase successfully deleted"
	end

	private

	def purchase_params
		if params[:purchase][:purchase_date].present?
			params[:purchase][:purchase_date] = Date.strptime(params[:purchase][:purchase_date], "%m/%d/%Y").to_s
		end
		params.require(:purchase).permit(:branch_id, :purchase_date, :invoice_number, :supplier_id)
	end

	def per_page
		params[:show].eql?('all') ? current_brand.purchases.count : params[:show]
		return 10 if params[:show].nil?
	end
end