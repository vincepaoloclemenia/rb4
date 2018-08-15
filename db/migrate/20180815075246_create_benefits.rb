class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :name
      t.references :employee, index: true, foreign_key: true
      t.string :identification

      t.timestamps null: false
    end
  end
end
