class BranchSubscription < ActiveRecord::Base
  belongs_to :branch
  belongs_to :subscription
  has_many :bills, through: :subscription
end
