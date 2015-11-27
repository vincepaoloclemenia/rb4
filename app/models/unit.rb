class Unit < ActiveRecord::Base
  belongs_to :brand
  has_many :items

 	scope :not_deleted, -> { where(is_deleted: false) }

  validates :brand_id, :name, :symbol, presence: true
	validates :name,           length: { maximum: 50 }
  validates :symbol,         length: { maximum: 50 }
  validates :remarks,        length: { maximum: 250 }
end