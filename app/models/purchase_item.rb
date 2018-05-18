class PurchaseItem < ActiveRecord::Base
	include PgSearch
	belongs_to :item
	belongs_to :unit
	belongs_to :purchase
	has_one :branch, through: :purchase
	validates :item_id, :quantity, :purchase_item_total_amount, :vat_type, presence: true
	default_scope { joins(:item).order("items.name ASC") }
	after_destroy { |pi| Activity.find_by_recordable_id(pi.id).destroy } 

	pg_search_scope :search_item, against: :item_id,
	using: { tsearch: { any_word: true } }

	def get_purchases_per_branch
		d = DateTime.now - 1
		purchase = Purchase.where(brand_id: current_brand, purchase_date: Date.today - 1)
		purchase.purchase_items
		branches = current_brand.branches
		branches.each do |branch|

		end
	end

	def item_total_amount
		purchase_item_total_amount.round(2)		
	end

	def item_total_vat
		return vat_type == "VAT-Exempted" ? 0.00 : (purchase_item_total_amount - (purchase_item_total_amount / 1.12).round(2)).round(2) 
	end

	def item_total_net
		return vat_type == "VAT-Exempted" ? item_total_amount : (purchase_item_total_amount / 1.12).round(2)
	end
end
