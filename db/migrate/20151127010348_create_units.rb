class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.belongs_to :brand, index: true, foreign_key: true
      t.string :name
      t.string :symbol
      t.string :remarks
      t.boolean :is_active, default: true
      t.boolean :track_as_sales
      t.boolean :is_deleted, default: false

      t.timestamps null: false
    end
  end
end
