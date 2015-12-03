class PurchaseItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :unit
  belongs_to :purchase

	validates :unit_id, :item_id, :quantity, :purchase_item_total_amount, :vat_type, presence: true
end
