class UsedJsonB < ActiveRecord::Migration
  def change
    enable_extension 'citext'
    enable_extension "hstore"
    create_table :brand_settings do |t|
      t.belongs_to :brand, index: true
      t.boolean :send_pos, default: false
      t.string :send_pos_from
      t.string :send_pos_to
      t.integer :selected_branches, array: true, default: []

      t.timestamps null: false
    end
    add_column :brand_settings, :purchase_order_privilege, :jsonb, null: false, default: '{}'
    add_column :brand_settings, :purchase_order_schedule, :hstore, array: true, default: []    
  end
  
end
