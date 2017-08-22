class AddFieldsSupplierPricing < ActiveRecord::Migration
  def change
  	add_column :supplier_item_prices, :supplier_item_unit, :string
  	add_column :supplier_item_prices, :packaging, :string
  end
end
