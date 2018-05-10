class PurchaseOrderItem < ActiveRecord::Base
	include PgSearch
	belongs_to :item
  	belongs_to :unit
	belongs_to :purchase_order
	belongs_to :brand
	belongs_to :branch

	validates :unit_id, :item_id, :quantity, presence: true
	validates_uniqueness_of :item_id, scope: :purchase_order
	after_create :update_purchase_order
	after_destroy :update_purchase_order

	pg_search_scope :poi_search,
	associated_against: { 
		item: [:id]
	}, using: { tsearch: { any_word: true } }

	def update_purchase_order
		po = self.purchase_order
		sum = po.purchase_order_items.pluck(:total_amount).sum
		subtotal = sum / 1.12
		vat = sum - subtotal
		po.update(sub_total: subtotal, vat: vat, total_amount: sum)
	end
	# def get_purchases_per_branch
	# 	d = DateTime.now - 1
	# 	purchase = Purchase.where(brand_id: current_brand, purchase_date: Date.today - 1)
	# 	purchase.purchase_items
	# 	branches = current_brand.branches
	# 	branches.each do |branch|

	# 	end
	# end

end
