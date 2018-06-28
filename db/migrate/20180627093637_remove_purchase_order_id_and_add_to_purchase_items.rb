class RemovePurchaseOrderIdAndAddToPurchaseItems < ActiveRecord::Migration
  def change
    remove_column :purchases, :purchase_order_item_id, :integer
    add_column :purchase_items, :purchase_order_item_id, :integer
  end
end
