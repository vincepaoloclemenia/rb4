class Sale < ActiveRecord::Base

  belongs_to :branch

  has_many :sale_by_category_entries, :dependent => :destroy
  accepts_nested_attributes_for :sale_by_category_entries, :reject_if => :all_blank, :allow_destroy=> true

  has_many :sale_by_settlement_entries, :dependent => :destroy
  accepts_nested_attributes_for :sale_by_settlement_entries, :reject_if => :all_blank, :allow_destroy=> true

  #has_many :sale_by_manifold_entries, :dependent => :destroy
  #accepts_nested_attributes_for :sale_by_manifold_entries, :reject_if => :all_blank, :allow_destroy=> true

  has_attached_file :daily_sales_record
  validates_attachment :daily_sales_record,
	  :content_type => { content_type: /^application\/(pdf)/, message: "Only accepts pdf" }

  validates :sale_date, :branch, :vat, :service_charge, :gc_sales, presence: true

	def net_sales
		self.sale_by_category_entries.pluck(:amount).sum
	end

	def total_settlement_sales
		self.sale_by_settlement_entries.where.not(amount: nil).pluck(:amount).sum
	end

	def total_sales_by_settlement_type
		if self.sale_by_settlement_entries.where(amount: nil).any?
			total_settlement_entries = 0
		else
			total_settlement_entries = 0
			total_settlement_entries = self.sale_by_settlement_entries.where.not(amount: nil).pluck(:amount).sum
			total_settlement_entries += [
				credit_card_sales.nil? ? 0 : credit_card_sales, 
				cash_in_drawer.nil? ? 0 : cash_in_drawer,
				gc_redeemed.nil? ? 0 : gc_redeemed, 
				delivery_sales.nil? ? 0 : delivery_sales].sum
		end
	end

	def sale_per_person_average(count)
		net_sales / count unless count.nil?
	end

	def self.get_total_sales(branch, date)
		sales = Sale.where(sale_date: date, branch_id: branch.id)
		amount = 0
		sales.each do |sale|
			amount += sale.net_sales
		end
		return amount
	end

	def self.get_customer_count(branch, date)
		sale = Sale.where(sale_date: date, branch_id: branch.id).last
		return sale.customer_count
	end

end