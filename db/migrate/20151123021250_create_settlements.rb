class CreateSettlements < ActiveRecord::Migration
  def change
    create_table :settlements do |t|
      t.string :name
      t.boolean :is_complimentary
      t.belongs_to :client, index: true, foreign_key: true
      t.string :description
      t.boolean :is_active
      t.boolean :breadcrumbs

      t.timestamps null: false
    end
  end
end
