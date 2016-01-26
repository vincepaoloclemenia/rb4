class PaymentNotification < ActiveRecord::Base
  belongs_to :subscription
end
