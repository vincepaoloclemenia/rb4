class Supplier < ActiveRecord::Base
  belongs_to :brand
  belongs_to :client
  belongs_to :branch
  validates :client_id, :name, presence: true

	scope :not_deleted, -> { where(is_deleted: false) }
end
