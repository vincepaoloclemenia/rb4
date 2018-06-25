class CreateBranchPurchaseOrderSetups < ActiveRecord::Migration
  def change
    create_table :branch_purchase_order_setups do |t|
      t.belongs_to :branch, index: true
      t.string :delivery_address
      t.string :delivery_from
      t.string :delivery_to
      
      t.timestamps null: false
    end
  end
end
