class CreateSaleByCategoryEntries < ActiveRecord::Migration
  def change
    create_table :sale_by_category_entries do |t|
      t.belongs_to :sale, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true
      t.decimal :amount, :precision => 16, :scale => 2, :default => 0.0
      t.datetime :date_created
      t.integer :client_id
      t.integer :brand_id
      t.integer :branch_id
      t.integer :subcategory_category_id
      t.integer :subcategory_id

      t.timestamps null: false
    end
  end
end
