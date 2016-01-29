class Dashboard < ActiveRecord::Base
	
	# def self.sample
	# 	puts "DASHBOARD MODEl"
	# end
	
	def self.populate_dashboard
		brands = Brand.all
		brands.each do |brand|
			@purchases = Purchase.get_total_purchases_per_branch(brand)
			@customer_counts = Sale.get_customer_count(brand.branches, brand)
			@purchases.each_with_index do |p, index|
				@customer_counts.each do |cc|
					if p[:branch_name] == cc[:branch_name]
						Dashboard.create(client_id: brand.client_id, brand_id: brand.id, branch_id: p[:branch_id], customer_count: cc[:customer_count], previous_date_entry: Date.today - 1, purchase_total_amount: p[:total_purchases_amount])
					end
				end	
			end
		end
	end
	
end
	