class CreateOrderPerSuppliers < ActiveRecord::Migration
  def change
    create_table :order_per_suppliers do |t|
      t.integer :supplier_id
    	t.integer :item_id
    	t.decimal :price_selected, precision: 16, scale: 2
    	t.integer :branch_id
    	t.integer :quantity 
    	t.string  :unit
    	t.text    :remarks
      t.timestamps null: false
    end
  end
end