class Supplier < ActiveRecord::Base
  belongs_to :brand
  belongs_to :client
  belongs_to :branch
  has_and_belongs_to_many :items
  validates :client_id, :name, presence: true
  scope :not_deleted, -> { where(is_deleted: false) }
end
