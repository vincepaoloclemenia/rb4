class ChangeColumnOfDataType < ActiveRecord::Migration
  def change
    remove_column :brand_settings, :email_for_sale
    add_column :brand_settings, :sales_emails, :string, array: true, default: []
  end
end
