class AddEmailsToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :emails, :string, array: true, default: []
  end
end
