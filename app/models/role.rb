class Role < ActiveRecord::Base
	has_one :client_user_access
  belongs_to :client

	validates :name,
						presence: true,
						length: {
							maximum: 50
						}
end
