class BranchSubscription < ActiveRecord::Base
  belongs_to :branch
  belongs_to :subscription
  has_many :bills, through: :subscription
  scope :active_subscriptions, -> { where active: true }
  scope :inactive_subscriptions, -> { where active: false }
end
