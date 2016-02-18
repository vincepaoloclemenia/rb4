class SetStockCountDefaultToInventoryItems < ActiveRecord::Migration
  def change
  	change_column :inventory_items, :stock_count, :decimal, :precision => 15, :scale => 2, :default => 0.00, :null => false
  end
end
