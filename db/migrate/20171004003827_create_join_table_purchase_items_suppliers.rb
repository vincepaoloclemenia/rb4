class CreateJoinTablePurchaseItemsSuppliers < ActiveRecord::Migration
  def change
    create_join_table :purchase_items, :suppliers do |t|
       t.index [:purchase_item_id, :supplier_id], name: 'purchase_items_suppliers_on_purchase_item_id_and_supplier_id'
      # t.index [:supplier_id, :purchase_item_id]
    end
  end
end
