class CreateEmployeeTypes < ActiveRecord::Migration
  def change
    create_table :employee_types do |t|
      t.string :name
      t.text :description
      t.integer :dividend_id

      t.timestamps null: false
    end
  end
end
