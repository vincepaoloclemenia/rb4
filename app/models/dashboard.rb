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
		where(previous_date_entry: date, branch_id: branch_id, brand_id: brand_id)
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

	def self.customer_count_check(customer_count)
		cc = 0
		customer_count.blank? ? cc = 0 : cc = customer_count
		return cc
	end
	# def self.get_sales_for_dashboard
	# 	start_day = Date.today - 7
 # 		range_dates = start_day..(Date.today-1)

 # 		@branches_sales = Array.new
 # 		current_brand.branches.each_with_index do |branch, index|
 # 			hash = Hash.new
 # 			total_day_amount = Array.new
 # 			range_dates.each_with_index do |date, index|
 # 				sales = Sale.where(sale_date: date, branch_id: branch.id)
 # 				amount = 0
 # 				sales.each do |sale|	
 # 					amount += sale.net_sales
 # 				end
 # 				total_day_amount[index] = amount.to_i
 # 			end
 # 			hash[:branch_name] = branch.name
 # 			hash[:amount] = total_day_amount
 # 			@branches_sales[index] = hash
 # 		end
 # 		return @branches_sales
	# end
	
end
	