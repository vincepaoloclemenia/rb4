class AddOptionForSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :manual_payment, :boolean, default: false
    add_column :branch_subscriptions, :date_subscribed, :date
    add_column :branch_subscriptions, :subs_start, :date
    add_column :branch_subscriptions, :subs_end, :date
    add_column :branch_subscriptions, :active, :boolean, default: true
    add_column :branch_subscriptions, :manual_payment, :boolean, default: false
  end
end
