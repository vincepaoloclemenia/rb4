class Item < ActiveRecord::Base
  belongs_to :brand
  belongs_to :unit
  belongs_to :category

  validates :brand_id, :category_id, :name, :unit_id, :item_type, presence: true
  validates :name,           length: { maximum: 50 }
  validates :item_type,      length: { maximum: 50 }

  scope :for_inventory, -> { where(is_active: true, item_type: "Inventory") }
end
