class Sale < ActiveRecord::Base
  belongs_to :branch

	has_many :sale_by_category_entries, :dependent => :destroy
  accepts_nested_attributes_for :sale_by_category_entries, :reject_if => :all_blank, :allow_destroy=> true

  has_many :sale_by_settlement_entries, :dependent => :destroy
  accepts_nested_attributes_for :sale_by_settlement_entries, :reject_if => :all_blank, :allow_destroy=> true

  has_many :sale_by_manifold_entries, :dependent => :destroy
  accepts_nested_attributes_for :sale_by_manifold_entries, :reject_if => :all_blank, :allow_destroy=> true

	validates :sale_date, :branch, :vat, :service_charge, :gc_sales, presence: true

	def net_sales
		self.sale_by_category_entries.pluck(:amount).sum
	end

	def total_settlement_sales
		self.sale_by_settlement_entries.where.not(amount: nil).pluck(:amount).sum
	end

	def total_sales_by_settlement_type
		total_settlement_entries = 0
		total_settlement_entries = self.sale_by_settlement_entries.where.not(amount: nil).pluck(:amount).sum
		total_settlement_entries += [credit_card_sales, cash_in_drawer, gc_redeemed, delivery_sales].sum
	end

	def sale_per_person_average(count)
		net_sales / count
	end

	# def self.get_customer_count(branches, brand)
	# 	arr = Array.new
	# 	branches.each_with_index do |branch, index|
	# 		hash = Hash.new
	# 		customer_count = Sale.select(:id, :customer_count).order('created_at DESC').where(brand_id: brand.id, branch_id: branch.id, sale_date: Date.today - 1).last
	# 		customer_count.nil? ? customer_count = 0 : customer_count = customer_count.customer_count
	# 		hash[:branch_name] = branch.name
	# 		hash[:customer_count] = customer_count
	# 		arr[index] = hash
	# 	end
	# 	return arr
	# end

	def self.get_total_sales(branch, date)
		sales = Sale.where(sale_date: date, branch_id: branch.id)
		amount = 0
		sales.each do |sale|
			amount += sale.net_sales
		end
		return amount
	end

	def self.get_customer_count(branch, date)
		customer_count = Sale.where(sale_date: date, branch_id: branch.id).last
		return customer_count
	end


	
	# def self.get_sales(range_dates, branch)
	# 	sales_amount = Array.new
	# 	hash = Hash.new
	# 	range_dates.each_with_index do |date, index|
	# 		sales = Sale.where(sale_date: date, branch_id: branch.id)
	# 		amount = 0
	# 		sales.each do |sale|
	# 			amount += sale.net_sales
	# 		end
	# 		sales_amount[index] = amount
	# 	end
	# 	hash[:branch_name] = branch.name
	# 	hash[:sales_amount] = sales_amount
	# 	return hash
	# end

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