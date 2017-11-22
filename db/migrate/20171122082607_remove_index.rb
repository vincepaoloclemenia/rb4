class RemoveIndex < ActiveRecord::Migration
  def change
    remove_column :branches, :user_id
  end
end
