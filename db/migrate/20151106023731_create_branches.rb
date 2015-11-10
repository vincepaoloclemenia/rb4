class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.belongs_to :brand, index: true, foreign_key: true
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :zip
      t.string :province_state
      t.string :country
      t.string :status
      t.string :landline_no
      t.string :mobile_no
      t.string :fax_no
      t.boolean :is_franchise
      t.string :email_address
      t.boolean :breadcrumbs
      t.boolean :is_deleted, default: false

      t.timestamps null: false
    end
  end
end
