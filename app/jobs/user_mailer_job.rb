class UserMailerJob < ActiveJob::Base
  queue_as :default

  def perform(purchase_order, purchase_order_items, user, recipient, subject, contact, title, message)
    UserMailer.send_purchase_order(purchase_order, purchase_order_items, user, recipient, subject, contact, title, message)
  end
end
