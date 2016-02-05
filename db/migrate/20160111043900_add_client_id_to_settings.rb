class AddClientIdToSettings < ActiveRecord::Migration
  def change
    add_reference :settings, :client, index: true, foreign_key: true
  end
end
