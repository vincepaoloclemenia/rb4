class Category < ActiveRecord::Base
  belongs_to :brand

  has_many :subcategories, class_name: "Category", foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent, class_name: "Category"

  validates :brand_id, :name, presence: true
  validates :name,           length: { maximum: 50 }, :uniqueness => {scope: :brand_id}
  validates :description,    length: { maximum: 250 }

  scope :main, -> { where(parent_id: nil) }
  scope :saleable, -> { where(is_active: true, track_as_sales: true) }
end
