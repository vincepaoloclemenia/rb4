class AddAssociationForOrderList < ActiveRecord::Migration
  def change
    add_reference :order_lists, :user, index: true
    add_reference :order_lists, :branch, index: true
    add_reference :order_lists, :brand, index: true
    add_reference :order_lists, :client, index: true
  end
end
