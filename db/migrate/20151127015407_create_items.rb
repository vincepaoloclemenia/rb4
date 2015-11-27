class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :brand, index: true, foreign_key: true
      t.belongs_to :unit, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true
      t.string :name
      t.string :item_type
      t.boolean :is_active, default: true
      t.boolean :track_as_sales
      t.boolean :is_deleted, default: false
      t.decimal :item_value
      t.string :item_code

      t.timestamps null: false
    end
  end
end
