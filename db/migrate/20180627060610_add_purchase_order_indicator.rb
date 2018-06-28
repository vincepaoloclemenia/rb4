class AddPurchaseOrderIndicator < ActiveRecord::Migration
  def change
    add_column :purchases, :saved_through_po, :boolean, default: false
    add_reference :purchases, :purchase_order, index: true
  end
end
