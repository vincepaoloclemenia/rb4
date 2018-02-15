class AddSubTotal < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :sub_total, :decimal, precision: 8, scale: 2
  end
end
