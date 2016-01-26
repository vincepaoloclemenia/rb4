class CreateBranchSubscriptions < ActiveRecord::Migration
  def change
    create_table :branch_subscriptions do |t|
      t.belongs_to :branch, index: true, foreign_key: true
      t.belongs_to :subscription, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
