class AddUsernameNameForAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :username, :string
    add_column :admins, :firstname, :string
    add_column :admins, :lastname, :string
    add_column :admins, :last_signed_in, :datetime
    add_column :admins, :last_signed_out, :datetime
  end
end
