class AddPoReferenceToPurchaseOrder < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :po_reference, :string
  end
end
