class CreateSaleBySettlementEntries < ActiveRecord::Migration
  def change
    create_table :sale_by_settlement_entries do |t|
      t.belongs_to :settlement, index: true, foreign_key: true
      t.belongs_to :sale, index: true, foreign_key: true
      t.integer :brand_id
      t.integer :branch_id
      t.date :date_created
      t.integer :client_id
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
