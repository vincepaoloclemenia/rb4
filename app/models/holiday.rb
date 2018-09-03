class Holiday < ActiveRecord::Base
  belongs_to :brand
  default_scope -> { order date: :asc }

  validates :name, presence: true, uniqueness: true
  validates :date, presence: true
  
  scope :about_to_come, -> { where("date >= :today", { today: Date.today }) }
end
