class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :name
      t.references :brand, index: true
      t.datetime :date
      t.text :description

      t.timestamps null: false
    end
  end
end
