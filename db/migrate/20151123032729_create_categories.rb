class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.belongs_to :brand, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.boolean :is_active, default: true
      t.boolean :track_as_sales
      t.boolean :is_deleted, default: false
      t.integer :parent_id

      t.timestamps null: false
    end
    add_index :categories, :parent_id
  end
end
