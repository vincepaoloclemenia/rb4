class AddDateOfSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :date_subscribed, :date
  end
end
