class SalesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		if params[:q]
			if params[:q][:sale_date_eq].present?
				params[:q][:sale_date_eq] = Date.strptime(params[:q][:sale_date_eq], "%m/%d/%Y").to_s
			else
				params[:q][:sale_date_eq] = Date.today.to_s
			end
		end
		@q = current_brand.sales.ransack(params[:q])
		#@sales = @q.result.paginate(page: params[:page], per_page: per_page)
		@branches = current_brand.branches.includes(:sales)
		# @sales = current_brand.sales
	end

	def show
		@sale = current_brand.sales.find(params[:id])
		@categories = current_brand.categories.main.saleable
		@settlements = current_client.settlements.saleable
	end

	def new
		@categories = current_brand.categories.main.saleable
		@settlements = current_client.settlements.saleable
		@sale = Sale.new
		@sale.sale_by_settlement_entries.build
		@sale.sale_by_category_entries.build
	end

	def create
		@sale = current_brand.sales.new(sale_params)
		@sale.sale_date = Date.strptime(params[:sale][:sale_date], "%m/%d/%Y").to_s if params[:sale][:sale_date].present?
		if @sale.save
			redirect_to sales_path, notice: "Sale successfully created"
		else
			redirect_to new_sale_path, alert: @sale.errors.full_messages.join(", "), params: sale_params
		end
	end

	def destroy
		current_brand.sales.find(params[:id]).destroy
		redirect_to sales_path, notice: "Sale successfully deleted"
	end

	private

		def sale_params
			params.require(:sale).permit(:branch_id, :sale_date, :shift_id, :customer_count, :transaction_count, :delivery_transaction_count, :daily_sales_record,
																	:credit_card_transaction_count, :first_time_guest, :repeat_guest, :vat, :service_charge, 
																	:credit_card_sales, :cash_in_drawer, :gc_redeemed, :delivery_sales, :gc_sales, :other_income,
																	sale_by_category_entries_attributes: [:id, :category_id, :amount],
																	sale_by_settlement_entries_attributes: [:id, :settlement_id, :amount])
		end

		def per_page
			
		end
end