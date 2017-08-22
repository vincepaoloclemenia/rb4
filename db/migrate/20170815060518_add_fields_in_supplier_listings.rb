class AddFieldsInSupplierListings < ActiveRecord::Migration
  def change
  	add_column :order_lists, :status, :string
  	add_column :order_lists, :pr_number, :string
  	add_column :order_lists, :pr_date, :datetime
  end
end
