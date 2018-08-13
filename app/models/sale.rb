class Sale < ActiveRecord::Base

  	belongs_to :branch

	has_many :sale_by_category_entries, :dependent => :destroy
	has_many :sales_stats, dependent: :destroy
	has_many :sales_non_misces, dependent: :destroy
	accepts_nested_attributes_for :sales_stats, :reject_if => :all_blank, :allow_destroy=> true
	accepts_nested_attributes_for :sales_non_misces, :reject_if => :all_blank, :allow_destroy=> true	
	accepts_nested_attributes_for :sale_by_category_entries, :reject_if => :all_blank, :allow_destroy=> true

	has_many :sale_by_settlement_entries, :dependent => :destroy
	accepts_nested_attributes_for :sale_by_settlement_entries, :reject_if => :all_blank, :allow_destroy=> true

	#has_many :sale_by_manifold_entries, :dependent => :destroy
	#accepts_nested_attributes_for :sale_by_manifold_entries, :reject_if => :all_blank, :allow_destroy=> true

	default_scope -> { order( sale_date: :desc )} 
 
	has_attached_file :daily_sales_record
	validates_attachment :daily_sales_record,
		:content_type => { content_type: /^application\/(pdf)/, message: "Only accepts pdf" }

	validates :sale_date, :branch, presence: true
	validates_uniqueness_of :sale_date, scope: :branch


	def net_sales
		sale_by_category_entries.pluck(:amount).sum
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

	def percentage_per_category(category)
		category.amount.to_f / net_sales.to_f * 100.0
	end

	def category_percentage_as_per(request)		
		percentage = if request == "vat"
			((vat / (net_sales + vat + service_charge)) * 100.0)
		elsif request == "service_charge"
			((service_charge / (net_sales + vat + service_charge)) * 100.0)
		elsif request == "revenues"
			((vat / (net_sales + vat + service_charge)) * 100.0) + ((service_charge / (net_sales + vat + service_charge)) * 100.0)
		end
		return percentage		
	end

	def settlement_percentage_as_per(request)		
		percentage = if request == "credit_card_sales"
			credit_card_sales.to_f / total_sales_by_settlement_type.to_f * 100.0 
		elsif request == "cash_in_drawer"
			cash_in_drawer.to_f / total_sales_by_settlement_type.to_f * 100.0
		elsif request == "gc_redeemed"
			gc_redeemed.to_f / total_sales_by_settlement_type.to_f * 100.0
		elsif request == "delivery_sales"
			delivery_sales.to_f / total_sales_by_settlement_type.to_f * 100.0
		end
		return percentage		
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

	def self.invalid_sales?
		all.where(sale_date: nil).size > 0 || all.empty?
	end

	def self.get_all_by_week_for_branch
		array = []
		Date.today.all_week.map do |date|
			sale_record = find_by_sale_date(date)
			if sale_record.present?
				array << { value: sale_record.net_total_sales }
			else
				array << { value: 0 }
			end
		end
		return array
	end

	def self.get_all_by_week
		Date.today.all_week.map do |date|
			all_sales = all.where(sale_date: date)
			{ value: all_sales.map(&:net_total_sales).sum.round(2) }
		end
	end


	def self.get_all_by_month
		Date::MONTHNAMES.reject { |m| m.nil? || m.to_date > Date.today }.map do |month|
			this_month_sales = all.where(sale_date: month.to_date.all_month)			
			{ value: this_month_sales.map(&:net_total_sales).sum.round(2) }		
		end
	end

	def self.get_sales_by_range(date)
		date.map do |day|
			sale = find_by_sale_date day
			sale.present? ? { value: sale.net_total_sales } : { value: 0.0 }
		end
	end
end