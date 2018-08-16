class Holiday < ActiveRecord::Base
  belongs_to :brand
  default_scope -> { order date: :asc }

  validates :name, presence: true, uniqueness: true
  validates :date, presence: true
end
