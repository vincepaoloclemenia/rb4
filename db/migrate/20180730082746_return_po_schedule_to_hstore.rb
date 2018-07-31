class ReturnPoScheduleToHstore < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    remove_column :brand_settings, :purchase_order_schedule
    add_column :brand_settings, :purchase_order_schedule, :hstore, array: true, default: []
  end
end
