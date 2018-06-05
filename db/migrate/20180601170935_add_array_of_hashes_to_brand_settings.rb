class AddArrayOfHashesToBrandSettings < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    add_column :brand_settings, :purchase_order_schedule, :hstore, array: true, default: []
  end
end
