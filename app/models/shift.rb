class Shift < ActiveRecord::Base
  belongs_to :brand

  validates	:brand_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }, :uniqueness => {scope: :brand_id}
end
