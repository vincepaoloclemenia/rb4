class AddNetTotalToSales < ActiveRecord::Migration
  def change
    add_column :sales, :net_total_sales, :decimal, precision: 16, scale: 2, default: 0.0
  end
end
