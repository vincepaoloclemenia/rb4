class ClientUserAccess < ActiveRecord::Base
  belongs_to :user
  belongs_to :client
  belongs_to :role
  belongs_to :brand
  belongs_to :branch

  # validates :user_id, presence: true
end
