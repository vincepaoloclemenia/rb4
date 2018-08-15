class CreateEmployeeBenefits < ActiveRecord::Migration
  def change
    create_table :employee_benefits do |t|
      t.belongs_to :brand, index: true
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps null: false
    end
    add_reference :benefits, :employee_benefit, index: true
  end
end
