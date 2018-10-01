class AddIndexForNonMisces < ActiveRecord::Migration
  def change
    add_column :non_misces, :parent_id, :integer
    add_index :non_misces, :parent_id
  end
end
