class AddCurrencyToBrandsAndTypeOfVats < ActiveRecord::Migration
  def change
    add_column :brands, :currency, :string
    create_table :tax_types do |t|
      t.string :name
      t.references :brand, index: true
      t.references :branch, index: true
      t.decimal :percentage
      t.text :description

      t.timestamps null: false
    end
  end
end
