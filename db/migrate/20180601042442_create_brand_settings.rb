class CreateBrandSettings < ActiveRecord::Migration
  def change
    create_table :brand_settings do |t|
      t.belongs_to :brand, index: true
      t.boolean :send_pos, default: false
      t.string :send_pos_from
      t.string :send_pos_to
      t.integer :selected_branches, array: true, default: []

      t.timestamps null: false
    end
  end
end
