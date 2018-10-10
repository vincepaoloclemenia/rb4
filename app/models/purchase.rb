class Purchase < ActiveRecord::Base
	include PgSearch
	extend FriendlyId
	friendly_id :invoice_number, use: :slugged
	belongs_to :client
	belongs_to :brand
	belongs_to :branch
	belongs_to :supplier
  	has_many :purchase_items, dependent: :destroy
	has_many :items, through: :purchase_items
	belongs_to :created_by, class_name: 'User', :foreign_key => 'user_created_by_id'
	belongs_to :modified_by, class_name: 'User', foreign_key: 'user_modified_by_id'
	belongs_to :purchase_order
	has_many :activities, dependent: :destroy
	
	default_scope -> { order(purchase_date: :desc)}

	accepts_nested_attributes_for :purchase_items,  :reject_if => :all_blank, :allow_destroy => :true

	validates :invoice_number, :purchase_date, :supplier_id, :brand_id, :branch_id, presence: true

	pg_search_scope :search_invoice, against: [ :invoice_number ], using: { tsearch: { prefix: true } }
	pg_search_scope :search_supplier, associated_against: { supplier: [:id] }, using: { tsearch: { any_word: true } }
	pg_search_scope :search_purchase_item, associated_against: { purchase_items: [:item_id] }, using: { tsearch: { any_word: true } }
	pg_search_scope :search_branch, associated_against: { branch: [:id] }, using: { tsearch: { any_word: true } }
	pg_search_scope :search_item, associated_against: { purchase_items: [:item_id] }, using: { tsearch: { any_word: true } }
	
	#validate :restrict_modification

	def self.get_total_purchases_per_branch(branch, date)
		@branch_purchases = Purchase.where(branch_id: branch.id, purchase_date: date)
		return get_total_purchases(@branch_purchases)
	end

	#def restrict_modification
	#	if created_at + 12.hours < DateTime.now
	#		errors.add("Unable ", "to delete or edit. You can only do this within 12 hours after creation")
	#	end
	#end

	def self.get_total_purchases(purchases)
		total_amount = 0
		purchases.each do |purchase|
			purchase.purchase_items.each do |pi|
				total_amount += pi.purchase_item_total_amount
			end
		end
		return total_amount
	end

	def allowed_to_modify?
		if brand.brand_setting.present?
			if brand.brand_setting.purchase_edit_limit.present?
				hrs = brand.brand_setting.purchase_edit_limit.to_i
				created_at + hrs.hours > DateTime.now
			else
				true
			end
		else
			true
		end
	end
	
	def item_added_already?(id)
		if purchase_order.present?
			items.pluck(:id).include? id
		end
	end

	def complete_purchase_items?
		purchase_items.pluck(:purchase_order_item_id).to_set.superset?(purchase_order.purchase_order_items.pluck(:id).to_set)
	end

	def unable_to_modify?
		created_at + 12.hours < DateTime.now
	end

	def compute_net_vat_total
		vat_rate = branch.percentage_tax[:dec] #12%
		total_net = 0
		total_vat = 0
		total_amount = 0

		purchase_items.each do |pi|
			if pi.vat_type == "VAT-Inclusive"
				total_amount += pi.purchase_item_total_amount.to_f
				total_vat += (pi.purchase_item_total_amount.to_f * vat_rate).to_f
				total_net += (pi.purchase_item_total_amount.to_f - (pi.purchase_item_total_amount.to_f * vat_rate).to_f).to_f
			elsif pi.vat_type == "VAT-Exclusive"
				total_vat += (pi.purchase_item_total_amount.to_f * vat_rate).to_f
				total_net += pi.purchase_item_total_amount.to_f
				total_amount += (pi.purchase_item_total_amount.to_f + (pi.purchase_item_total_amount.to_f * vat_rate).to_f).to_f
			else #VAT-Exempted
				total_vat += 0.00
				total_net += pi.purchase_item_total_amount.to_f
				total_amount += pi.purchase_item_total_amount.to_f
			end
		end
		
		return { net: total_net, vat: total_vat, total: total_amount }
	end

	def overall_vat
		purchase_items.map(&:item_total_vat).sum.round(2)
	end

	def overall_net
		purchase_items.map(&:item_total_net).sum.round(2)
	end

	def overall_amount
		purchase_items.map(&:item_total_amount).sum.round(2)
	end

	def self.with_purchase_items
		all.includes(:purchase_items).where.not( purchase_items: { purchase_id: nil })
	end

	def self.search_purchases(suppliers, branches, items, invoice_number)
		keywords = "all#{invoice_number == '' ? '' : '.search_invoice(invoice_number)'}#{suppliers.present? ? '.search_supplier(suppliers)' : ''}#{branches.present? ? '.search_branch(branches)' : ''}#{items.present? ? '.search_item(items)' : ''}"
		eval(keywords)
	end

	def self.get_all_by_week_for_branch
		arr = []
		Date.today.all_week.map do |date|
			purchase = find_by_purchase_date(date)
			if purchase
				arr << { value: purchase.purchase_items.map(&:item_total_net).sum.round(2) }
			else
				arr << { value: 0.0 }
			end
		end
		return arr
	end

	def self.get_all_by_week
		Date.today.all_week.map do |date|
			all_purchases = all.where(purchase_date: date)
			{ value: all_purchases.map(&:total_net_sum).sum.round(2) }
		end
	end

	def self.get_all_by_month
		arr = []
		Date::MONTHNAMES.reject { |m| m.nil? }.map do |month|
			this_month_purchases = all.where(purchase_date: month.to_date.all_month)
			{ value: this_month_purchases.map(&:total_net_sum).sum.round(2) }
		end
	end

	def self.get_price_movement(date, id)
		last_purchase = find_by_purchase_date(date)
		purchase_item = last_purchase.purchase_items.find_by_item_id(id) if last_purchase.present?
		current_amount = purchase_item.nil? ? nil : purchase_item.item_total_net / purchase_item.quantity
		last_week_purchases = all.where(purchase_date: date.last_week.all_week).includes(:purchase_items)
		last_month_purchases = all.where(purchase_date: date.last_month.all_month).includes(:purchase_items)		
		
		#Get last week's average amount
		last_week_amount = if last_week_purchases.present?
								total = last_week_purchases.map { |pur| pur.purchase_items.where(item_id: id).map(&:item_total_net).sum }.sum
								quantity = last_week_purchases.map { |pur| pur.purchase_items.where(item_id: id).map(&:quantity).sum }.sum
								if total > 0 && quantity > 0 
									total / quantity
								else 
									0.0
								end
							else
								0.0
							end
		#Get last month's average amount
		last_month_amount = if last_month_purchases.present?
								total = last_month_purchases.map { |pur| pur.purchase_items.where(item_id: id).map(&:item_total_net).sum }.sum 
								quantity = last_month_purchases.map { |pur| pur.purchase_items.where(item_id: id).map(&:quantity).sum }.sum
								if total > 0 && quantity > 0
									total / quantity
								else 
									0.0
								end
							else
								0.0
							end
		#compute difference current amount against last week's/month's amount
		last_week_difference = current_amount.nil? || last_week_amount == 0 ? 0.0 : current_amount - last_week_amount
		last_month_difference = current_amount.nil? || last_month_amount == 0 ? 0.0 : current_amount - last_month_amount 	

		#Compute Percentage for Last Week and Last Month
		if current_amount
			last_week_percentage = last_week_difference.present? && last_week_amount > 0 ? ( last_week_difference / last_week_amount).round(2) : 0.0
			last_month_percentage = last_month_difference.present? && last_month_amount > 0 ? ( last_month_difference / last_month_amount).round(2) : 0.0
		else
			last_week_percentage = 0.0
			last_month_percentage = 0.0
		end
		
		return {
			current_amount: current_amount,
			last_week_amount: last_week_amount,
			last_week_difference: last_week_difference,
			last_month_difference: last_month_difference,
			last_month_amount: last_month_amount,
			last_week_percentage: (last_week_percentage * 100).round(2),
			last_month_percentage: (last_month_percentage * 100).round(2),
			last_week_comparison: last_week_difference > 0 || last_week_percentage > 0,
			last_month_comparison: last_month_difference > 0 || last_month_percentage > 0
		}
	end

	def update_total_net_sum
		if purchase_items.present?
			update(total_net_sum: purchase_items.map(&:item_total_net).sum)
		end
	end
	

end
