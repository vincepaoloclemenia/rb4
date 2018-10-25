class AddBranchType < ActiveRecord::Migration
  def change
    add_column :branches, :branch_type, :string
  end
end
