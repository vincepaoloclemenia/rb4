class PurchasesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		@purchases = current_brand.purchases
		@purchase = current_brand.purchases.new
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
	end

	def create
		@purchase = current_brand.purchases.new(purchase_params)
		@purchase.user_created_by_id = current_user.id
		if @purchase.save
			flash[:notice] = "Purchase successfully created"
		else
			flash[:alert] = @purchase.errors.full_messages.join(", ")
		end
		redirect_to purchases_path
	end

	def update
		@purchase = current_brand.purchases.find(params[:id])
		if @purchase.update(purchase_params)
			@purchase.update(user_modified_by_id: current_user.id)
			flash[:notice] = "Purchase successfully updated"
		else
			flash[:alert] = @purchase.errors.full_messages.join(", ")
		end
		redirect_to purchases_path
	end

	def destroy
		@purchase = current_brand.purchases.find(params[:id])
		@purchase.destroy
		redirect_to purchases_path, notice: "Purchase successfully deleted"
	end

	private

	def purchase_params
		if params[:purchase][:purchase_date].present?
			params[:purchase][:purchase_date] = Date.strptime(params[:purchase][:purchase_date], "%m/%d/%Y").to_s
		end
		params.require(:purchase).permit(:branch_id, :purchase_date, :invoice_number, :supplier_id)
	end
end