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

	def self.update_customer_count
		yesterday = Date.today-1
		@sale = Sale.select(:customer_count, :branch_id).where(sale_date: yesterday)
	end

	def self.update_customer_count
		date = Date.today-2
		@sale = Sale.select(:id, :customer_count, :branch_id).where(created_at: date.beginning_of_day..date.end_of_day)
		# @sale.last.customer_count
	end

end
