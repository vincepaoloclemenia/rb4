class AddEmailForSaleSetup < ActiveRecord::Migration
  def change
    add_column :brand_settings, :email_for_sale, :string
  end
end
