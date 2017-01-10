class CreateSupplierItemPrices < ActiveRecord::Migration
  def change
    create_table :supplier_item_prices do |t|
    	t.integer :supplier_id
    	t.integer :item_id
    	t.decimal :supplier_amount, precision: 16, scale: 2
      t.timestamps null: false
    end
  end
end
