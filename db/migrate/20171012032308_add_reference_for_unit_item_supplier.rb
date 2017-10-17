class AddReferenceForUnitItemSupplier < ActiveRecord::Migration
  def change
    add_column :supplier_item_prices, :unit_id, :integer
    add_index :supplier_item_prices, :unit_id
  end
end
