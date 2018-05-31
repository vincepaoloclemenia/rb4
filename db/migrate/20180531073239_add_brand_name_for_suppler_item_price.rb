class AddBrandNameForSupplerItemPrice < ActiveRecord::Migration
  def change
    add_column :supplier_item_prices, :brand_name, :string 
  end
end
