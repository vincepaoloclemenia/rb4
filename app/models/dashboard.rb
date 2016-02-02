class Dashboard < ActiveRecord::Base
		
	# def self.populate_dashboard
	# 	brands = Brand.all
	# 	brands.each do |brand|
	# 		@purchases = Purchase.get_total_purchases_per_branch(brand)
	# 		@customer_counts = Sale.get_customer_count(brand.branches, brand)
	# 		@purchases.each_with_index do |p, index|
	# 			@customer_counts.each do |cc|
	# 				if p[:branch_name] == cc[:branch_name]
	# 					Dashboard.create(client_id: brand.client_id, brand_id: brand.id, branch_id: p[:branch_id], customer_count: cc[:customer_count], previous_date_entry: Date.today - 1, purchase_total_amount: p[:total_purchases_amount])
	# 				end
	# 			end	
	# 		end
	# 	end
	
	def self.populate_dashboard
		brands = Brand.all
		date = Date.today - 1
		brands.each do |brand|
			brand.branches.each do |branch|
				@customer_count = Sale.get_customer_count(branch, date)
				@purchase_total = Purchase.get_total_purchases_per_branch(branch, date)
				@sales_total = Sale.get_total_sales(branch, date)
				Dashboard.create(client_id: brand.client_id, brand_id: brand.id, branch_id: branch.id, customer_count: @customer_count, previous_date_entry: date, purchase_total_amount: @purchase_total, sales_total_amount: @sales_total)
				# @customer_count = Sale.get_customer_count(branch, brand)
			end
		end
	end

	def self.get_sales_for_dashboard
		start_day = Date.today - 7
 		range_dates = start_day..(Date.today-1)

 		@branches_sales = Array.new
 		current_brand.branches.each_with_index do |branch, index|
 			hash = Hash.new
 			total_day_amount = Array.new
 			range_dates.each_with_index do |date, index|
 				sales = Sale.where(sale_date: date, branch_id: branch.id)
 				amount = 0
 				sales.each do |sale|	
 					amount += sale.net_sales
 				end
 				total_day_amount[index] = amount.to_i
 			end
 			hash[:branch_name] = branch.name
 			hash[:amount] = total_day_amount
 			@branches_sales[index] = hash
 		end
 		return @branches_sales
	end
	
end
	