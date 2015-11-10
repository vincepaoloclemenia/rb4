class Role < ActiveRecord::Base
	has_one :client_user_access
  belongs_to :client
end
