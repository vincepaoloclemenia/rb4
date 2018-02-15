class PurchaseOrderItem < ActiveRecord::Base
	belongs_to :item
  	belongs_to :unit
  	belongs_to :purchase_order

	validates :unit_id, :item_id, :quantity, presence: true

	after_create :update_purchase_order
	after_destroy :update_purchase_order

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
