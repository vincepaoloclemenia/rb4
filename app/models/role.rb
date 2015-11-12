class Role < ActiveRecord::Base
	has_many :client_user_accesses
  belongs_to :client
  has_many :users, through: :client_user_accesses

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}
end
