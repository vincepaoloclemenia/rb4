class InventoryItem < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :item
  default_scope -> { includes(:item).order("items.name ASC") }
end
