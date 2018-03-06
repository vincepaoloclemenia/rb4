class AddFooterForBrands < ActiveRecord::Migration
  def change
    add_column :brands, :email_footer, :text
  end
end
