class AddSlugToPurchaseOrdersBrands < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :slug, :string
    add_column :brands, :slug, :string
    add_column :purchases, :slug, :string
    add_column :suppliers, :slug, :string 
  end
end
