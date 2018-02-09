class RenameEmails < ActiveRecord::Migration
  def change
    rename_column :suppliers, :emails, :email_addresses
  end
end
