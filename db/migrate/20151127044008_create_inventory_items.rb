class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.belongs_to :inventory, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true
      t.integer :stock_count

      t.timestamps null: false
    end
  end
end
