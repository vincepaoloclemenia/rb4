class AddIndexForUsersToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :user_id, :integer
    add_index :branches, :user_id
  end
end
