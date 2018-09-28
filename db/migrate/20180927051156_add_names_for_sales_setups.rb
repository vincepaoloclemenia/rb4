class AddNamesForSalesSetups < ActiveRecord::Migration
  def change
    add_column :sales_stats, :name, :string
    add_column :sales_non_misces, :name, :string
  end
end
