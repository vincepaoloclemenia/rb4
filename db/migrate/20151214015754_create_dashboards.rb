class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.belongs_to :client, index: true, foreign_key: true
    	t.belongs_to :brand, index: true, foreign_key: true
      t.belongs_to :branch, index: true, foreign_key: true
      t.integer :customer_count
      t.datetime :previous_date_entry
      t.timestamps null: false
    end
  end
end
