class Settlement < ActiveRecord::Base
	belongs_to :client

	validates :name, length: { maximum: 50 }
	validates :name, :client_id, presence: true
end
