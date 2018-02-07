class AddAssociationsForPurchaseOrder < ActiveRecord::Migration
  def change
    add_reference :purchase_orders, :user, index: true
  end
end
