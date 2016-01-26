class AddClientIdToBills < ActiveRecord::Migration
  def change
    add_reference :bills, :client, index: true, foreign_key: true
  end
end
