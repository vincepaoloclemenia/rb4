class Inventory < ActiveRecord::Base
  belongs_to :branch
  belongs_to :user
  has_many :inventory_items, dependent: :destroy
  accepts_nested_attributes_for :inventory_items,:allow_destroy => :true, reject_if: proc { |ii| ii["stock_count"].blank? }

  validates :branch_id, :user_id, :entry_date, presence: true
  validates :entry_date, uniqueness: { scope: :branch_id }
end
