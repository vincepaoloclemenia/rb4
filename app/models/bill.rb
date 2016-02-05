class Bill < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :client
end
