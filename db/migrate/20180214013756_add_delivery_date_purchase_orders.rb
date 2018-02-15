class AddDeliveryDatePurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :delivery_date, :date
    add_column :purchase_orders, :vat, :decimal, precision: 8, scale: 2
    add_column :purchase_orders, :total_amount, :decimal, precision: 8, scale: 2
    add_column :brands, :email, :string
  end
end
