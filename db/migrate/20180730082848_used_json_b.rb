class UsedJsonB < ActiveRecord::Migration
  def change
    enable_extension 'citext'
    remove_column :brand_settings, :purchase_order_privilege
    add_column :brand_settings, :purchase_order_privilege, :jsonb, null: false, default: '{}'
  end
end
