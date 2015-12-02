class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.belongs_to :brand, index: true, foreign_key: true
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :branch, index: true, foreign_key: true
      t.string :name
      t.text :address
      t.string :email
      t.string :contact_person
      t.string :contact_title
      t.string :tin
      t.string :mobile_no
      t.string :fax_no
      t.string :landline_no
      t.boolean :is_active
      t.integer :assigned_to, default: 1
      t.boolean :is_deleted, default: false

      t.timestamps null: false
    end
  end
end
