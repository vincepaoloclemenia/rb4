class AddTotalAmount < ActiveRecord::Migration
  def change
    add_column :purchase_order_items, :total_amount, :decimal, precision: 8, scale: 2
  end
end
