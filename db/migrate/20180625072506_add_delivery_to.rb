class AddDeliveryTo < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :delivery_time_to, :string
    add_column :purchase_orders, :delivery_address, :string 
  end
end
