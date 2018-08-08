class AddTables < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :is_active
      t.timestamps null: false
    end
    create_table :non_miscelaneouses do |t|
      t.belongs_to :client, index: true
      t.string :name
      t.text :description
      t.boolean :is_active
      t.timestamps null: false
    end
    create_table :statistics do |t|
      t.belongs_to :client, index: true
      t.string :name
      t.text :description
      t.boolean :is_active
      t.timestamps null: false
    end
    create_table :sales_non_misces do |t|
      t.belongs_to :sale, index: true
      t.belongs_to :non_miscelaneous, index: true
      t.belongs_to :branch, index: true
      t.integer :count
      t.timestamps null: false
    end
    create_table :sales_stats do |t|
      t.belongs_to :sale, index: true
      t.belongs_to :statistic, index: true
      t.belongs_to :branch, index: true
      t.integer :count
      t.timestamps null: false
    end
    create_table :sales_revenues do |t|
      t.belongs_to :sale, index: true
      t.belongs_to :revenue, index: true
      t.belongs_to :branch, index: true
      t.decimal :amount, precision: 16, scale: 2, default: 0.0
      t.timestamps null: false
    end
  end
end
