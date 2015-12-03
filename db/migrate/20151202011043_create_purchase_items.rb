class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.belongs_to :item, index: true, foreign_key: true
      t.belongs_to :unit, index: true, foreign_key: true
      t.belongs_to :purchase, index: true, foreign_key: true
      t.decimal :quantity
      t.decimal :purchase_item_amount, precision: 16, scale: 2
      t.string :remarks
      t.string :vat_type
      t.decimal :purchase_item_total_amount
      t.integer :borrowed_from_id

      t.timestamps null: false
    end
  end
end
