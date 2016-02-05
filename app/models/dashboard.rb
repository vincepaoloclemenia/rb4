class Dashboard < ActiveRecord::Base

	def self.populate_dashboard
		brands = Brand.all
		date = Date.today - 1
		brands.each do |brand|
			brand.branches.each do |branch|
				@customer_count = Sale.get_customer_count(branch, date)
				@purchase_total = Purchase.get_total_purchases_per_branch(branch, date)
				@sales_total = Sale.get_total_sales(branch, date)
				Dashboard.create(client_id: brand.client_id, brand_id: brand.id, branch_id: branch.id, customer_count: @customer_count, previous_date_entry: date, purchase_total_amount: @purchase_total, sales_total_amount: @sales_total)
			end
		end
	end

	def self.get_dashboard_items(date, branch_id, brand_id)
		find_by(previous_date_entry: date, branch_id: branch_id, brand_id: brand_id)
	end

	def self.check_purchase_total_index(purchase_array_amount)
		purchase_total = Array.new
		if purchase_array_amount.blank?
			purchase_total = Array.new(7, 0)
		else
			purchase_array_amount.each_with_index do |amount, index|
				amount.blank? ? purchase_total[index] = 0 : purchase_total[index] = amount
			end
		end
		return purchase_total
	end

	def self.check_value(dashboard_value)
		number = 0
		dashboard_value.nil? ? number = 0 : number = dashboard_value.to_i 
		return number
	end

	def self.get_array_dashboard_values(range_date, brand, branch, module_type)
		dashboard_items_amounts = Array.new
 		range_date.each_with_index do |date, index|
 			dashboard_item = get_dashboard_items(date, branch.id, brand.id)
 			dashboard_item.blank? ? amount = 0 : amount = filter_module(module_type, dashboard_item)
 			dashboard_items_amounts[index] = amount
 		end
	 	return dashboard_items_amounts
 	end

 	def self.filter_module(module_type, dashboard_item)
 		amount = 0
 		if module_type == 'sales'
 			amount = check_value(dashboard_item.sales_total_amount)
 		else module_type == 'purchase'
 			amount = check_value(dashboard_item.purchase_total_amount)
 		end
 	end
end
	