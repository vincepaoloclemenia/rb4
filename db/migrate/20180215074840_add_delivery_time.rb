class AddDeliveryTime < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :delivery_time, :string
  end
end
