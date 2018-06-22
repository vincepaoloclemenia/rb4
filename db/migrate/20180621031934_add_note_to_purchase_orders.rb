class AddNoteToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :note, :string
    add_column :purchase_orders, :saved_as_purchase, :boolean, default: false
  end
end
