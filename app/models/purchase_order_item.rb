class PurchaseOrderItem < ActiveRecord::Base
	belongs_to :item
  belongs_to :unit
  belongs_to :purchase_order

	validates :unit_id, :item_id, :quantity, presence: true


	# def get_purchases_per_branch
	# 	d = DateTime.now - 1
	# 	purchase = Purchase.where(brand_id: current_brand, purchase_date: Date.today - 1)
	# 	purchase.purchase_items
	# 	branches = current_brand.branches
	# 	branches.each do |branch|

	# 	end
	# end


end