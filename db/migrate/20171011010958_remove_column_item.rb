class RemoveColumnItem < ActiveRecord::Migration
  def change
    remove_column :items, :price
  end
end
