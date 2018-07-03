class Supplier < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :brand
  belongs_to :client
  belongs_to :branch
  has_many :purchase_orders, dependent: :destroy
  has_and_belongs_to_many :items
  has_many :prices, class_name: 'SupplierItemPrice'
  validates :client_id, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: ' already exists' }
  default_scope -> { order(name: :asc) }
  scope :not_deleted, -> { where(is_deleted: false) }

  before_save :capitalize_name

  def capitalize_name
    name.split.map(&:capitalize!).join(" ")
  end

  def self.search(term)
    if term
      where('name LIKE ? OR contact_person LIKE ?', "%#{term}%", "%#{term}%")
    else
      all
    end
  end

  def remaining_items
    items.where.not(id: prices.pluck(:item_id)).pluck(:name, :id)
  end

  def self.with_prices
    all.includes(:prices).where.not( supplier_item_prices: { supplier_id: nil } )
  end

end
