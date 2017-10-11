class Item < ActiveRecord::Base
  belongs_to :brand
  belongs_to :unit
  belongs_to :category
  has_many :inventory_items
  has_many :supplier_item_prices
  has_and_belongs_to_many :suppliers
  default_scope -> { order(name: :asc) }
  accepts_nested_attributes_for :suppliers, reject_if: :all_blank, allow_destroy: true

  before_save :capitalize_item
  
  validates :brand_id, :category_id, :name, :supplier_ids, :unit_id, :item_type, presence: true
  validates :name,           length: { maximum: 50 }
  validates :item_type,      length: { maximum: 50 }
  scope :for_inventory, -> { where(is_active: true, item_type: "Inventory") }

  def capitalize_item
    name.capitalize!
  end

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end

end