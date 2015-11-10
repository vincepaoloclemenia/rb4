class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.string :landline_no
      t.string :mobile_no
      t.string :fax_no
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_update_at
      t.string :website
      t.boolean :is_deleted, default: false

      t.timestamps null: false
    end
  end
end
