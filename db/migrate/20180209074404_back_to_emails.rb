class BackToEmails < ActiveRecord::Migration
  def change
    rename_column :suppliers, :email_addresses, :emails
  end
end
