class Dashboard < ActiveRecord::Base
	
	def self.sample
		puts "DASHBOARD MODEl"
	end
	
	def populate_dashboard
		@purchases = Purchase.get_total_purchases_per_branch(current_brand)
		@customer_counts = Sale.get_customer_count(current_brand.branches)
		@purchases.each_with_index do |p, index|
			@customer_counts.each do |cc|
				if p[:branch_name] == cc[:branch_name]
					Dashboard.create(client_id: current_brand.client_id, brand_id: current_brand.id, branch_id: p[:branch_id], customer_count: cc[:customer_count], previous_date_entry: Date.today - 1, purchase_total_amount: p[:total_purchases_amount])
				end
			end	
		end
	end
	
end
