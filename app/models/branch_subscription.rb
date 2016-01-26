class BranchSubscription < ActiveRecord::Base
  belongs_to :branch
  belongs_to :subscription
end
