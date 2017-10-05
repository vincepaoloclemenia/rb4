class DropTableItemsSuppliers < ActiveRecord::Migration
  def change
    drop_table :items_suppliers
  end
end
