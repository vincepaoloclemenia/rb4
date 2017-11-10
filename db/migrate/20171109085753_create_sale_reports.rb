class CreateSaleReports < ActiveRecord::Migration
  def change
    create_table :sale_reports do |t|
      t.belongs_to :user, index: true
      t.belongs_to :brand, index: true
      t.string :title
      t.datetime :from
      t.datetime :to
      t.integer :num_of_days
      t.decimal :total_sales, precision: 2, default: 0.0

      t.timestamps null: false
    end
  end
end
