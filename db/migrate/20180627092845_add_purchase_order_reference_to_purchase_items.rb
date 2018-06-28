class AddPurchaseOrderReferenceToPurchaseItems < ActiveRecord::Migration
  def change
    add_column :purchases, :purchase_order_item_id, :integer
  end
end
