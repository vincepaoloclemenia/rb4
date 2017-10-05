class CreateJoinTableItemsSuppliers < ActiveRecord::Migration
  def change
    drop_table :purchase_items_suppliers
    create_join_table :items, :suppliers do |t|
      t.index [:item_id, :supplier_id]
      # t.index [:supplier_id, :item_id]
    end
  end
end
