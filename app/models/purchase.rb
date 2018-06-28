class Purchase < ActiveRecord::Base
	include PgSearch
	belongs_to :client
	belongs_to :brand
	belongs_to :branch
	belongs_to :supplier
  	has_many :purchase_items, dependent: :destroy
	has_many :items, through: :purchase_items
	belongs_to :created_by, class_name: 'User', :foreign_key => 'user_created_by_id'
	belongs_to :modified_by, class_name: 'User', foreign_key: 'user_modified_by_id'
	belongs_to :purchase_order
	
	default_scope -> { order(purchase_date: :desc)}

	accepts_nested_attributes_for :purchase_items,  :reject_if => :all_blank, :allow_destroy => :true

	validates :invoice_number, :purchase_date, :supplier_id, :brand_id, :branch_id, presence: true

	pg_search_scope :search_invoice, against: [ :invoice_number ], using: { tsearch: { prefix: true } }
	pg_search_scope :search_supplier, associated_against: { supplier: [:id] }, using: { tsearch: { any_word: true } }
	pg_search_scope :search_purchase_item, associated_against: { purchase_items: [:item_id] }, using: { tsearch: { any_word: true } }
	pg_search_scope :search_branch, associated_against: { branch: [:id] }, using: { tsearch: { any_word: true } }

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
		created_at + 12.hours > DateTime.now
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
		vat_rate = 0.12 #12%
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

	def self.search_purchases(suppliers, branches, invoice_number)
		keywords = "all#{invoice_number == '' ? '' : '.search_invoice(invoice_number)'}#{suppliers.present? ? '.search_supplier(suppliers)' : ''}#{branches.present? ? '.search_branch(branches)' : ''}"
		eval(keywords)
	end

end
