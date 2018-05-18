class AddSentNotifierFOrPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :date_sent, :datetime
    add_column :purchase_orders, :sent, :boolean
  end
end
