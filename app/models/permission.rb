class Permission < ActiveRecord::Base
  belongs_to :role
  belongs_to :section
  belongs_to :client
end