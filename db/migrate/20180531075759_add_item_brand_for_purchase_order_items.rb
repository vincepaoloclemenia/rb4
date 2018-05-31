class AddItemBrandForPurchaseOrderItems < ActiveRecord::Migration
  def change
    add_column :purchase_order_items, :item_brand, :string
  end
end
