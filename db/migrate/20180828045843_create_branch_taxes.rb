class CreateBranchTaxes < ActiveRecord::Migration
  def change
    create_table :branch_taxes do |t|
      t.references :branch, index: true
      t.references :tax_type, index: true
      t.decimal :percentage
      t.timestamps null: false
    end
  end
end
