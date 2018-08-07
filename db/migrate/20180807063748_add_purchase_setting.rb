class AddPurchaseSetting < ActiveRecord::Migration
  def change
    add_column :brand_settings, :purchase_edit_limit, :string
  end
end
