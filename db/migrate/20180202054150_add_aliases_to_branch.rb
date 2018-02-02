class AddAliasesToBranch < ActiveRecord::Migration
  def change
    add_column :branches, :alias, :string
  end
end
