class Settlement < ActiveRecord::Base
	belongs_to :client
	has_one :statistic
	validates :name, length: { maximum: 50 }
	validates :name, :client_id, presence: true

	scope :saleable, -> { where(is_active: true) }

	default_scope -> { order(created_at: :desc)}
end
