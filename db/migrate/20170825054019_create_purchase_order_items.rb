class CreatePurchaseOrderItems < ActiveRecord::Migration
  def change
    create_table :purchase_order_items do |t|
    	t.integer   :item_id
    	t.integer		:unit_id
    	t.integer		:purchase_order_id
    	t.decimal   :quantity
    	t.decimal   :price_selected, precision: 16, scale: 2
    	t.string    :remarks
      t.timestamps null: false
    end
  end
end