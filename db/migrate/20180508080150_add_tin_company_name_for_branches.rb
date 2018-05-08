class AddTinCompanyNameForBranches < ActiveRecord::Migration
  def change
    add_column :branches, :tin_number, :string
    add_column :branches, :company_registered_name, :string
  end
end
