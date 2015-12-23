class ProfitAndLossesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		@categories = current_brand.categories.main.saleable

		end_date = Date.strptime(params[:date_entry], "%m/%d/%Y") rescue Date.today
		start_date = end_date.beginning_of_month

		@sales = current_brand.sales.where(branch_id: branch_id, sale_date: start_date..end_date)

		#@sale_entries = @sales.sale_by_category_entries.where(category_id: @categories.pluck(:id))
		@sale_entries = SaleByCategoryEntry.where(sale_id: @sales.ids, category_id: @categories.ids)

		@purchases = current_brand.purchases.where(purchase_date: start_date..end_date, branch_id: branch_id)
		@purchase_items = PurchaseItem.where(purchase_id: @purchases.ids).includes(item: :category)

		@category_controllable = current_brand.categories.where("name LIKE ? OR name LIKE ?", 'CONTROLLABLE%', 'Controllable%')
		@category_listing = current_brand.categories.where(parent_id: @category_controllable.ids)

		@category_non_controllable = current_brand.categories.where("name LIKE ? OR name LIKE ?", 'NON - CONTROLLABLE%', 'Non - Controllable%')
		@category_listing2 = current_brand.categories.where(parent_id: @category_non_controllable.ids)

		item_names_arr = ['Chief Supervision', 'Service Labor', 'Kitchen Labor']
		items = current_brand.items.where(name: item_names_arr)
		@base_wages = []
		items.each do |item|
			purchase_items_amount = @purchase_items.where(item_id: item.id).sum(:purchase_item_total_amount)
			@base_wages << { item_name: item.name, purchase_total_item_amount: purchase_items_amount.to_f }
		end


    item_names_arr = ['SSS','Philhealth','Pag-Ibig','Employee Benefits','13th Month']
    items = current_brand.items.where(name: item_names_arr)
    @employee_fringe_expenses = []
    items.each do |item|
    	purchase_items_amount = @purchase_items.where(item_id: item.id).sum(:purchase_item_total_amount)
    	@employee_fringe_expenses << { item_name: item.name, purchase_total_item_amount: purchase_items_amount.to_f }
    end

    @total_customer_count = @sales.sum(:customer_count)
    @total_daily_average_sales = @sale_entries.sum(:amount)
	end


	def branch_id
		@branch_id = params[:branch_id].present? ? params[:branch_id] : current_brand.branches.pluck(:id)
		@branch_id
	end
end