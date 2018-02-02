class RenameAliasColumn < ActiveRecord::Migration
  def change
    rename_column :branches, :alias, :aka
  end
end
