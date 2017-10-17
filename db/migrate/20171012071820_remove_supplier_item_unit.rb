class RemoveSupplierItemUnit < ActiveRecord::Migration
  def change
    remove_column :supplier_item_prices, :supplier_item_unit
  end
end
