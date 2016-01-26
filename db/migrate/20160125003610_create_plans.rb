class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.decimal :amount, precision: 15, scale: 2 
      t.string :period
      t.string :plan_type
      t.integer :brand_limit
      t.integer :branch_limit

      t.timestamps null: false
    end
  end
end
