class UsedJsonB < ActiveRecord::Migration
  def change
    enable_extension 'citext'
    add_column :brand_settings, :purchase_order_privilege, :jsonb, null: false, default: '{}'
  end
  
end
