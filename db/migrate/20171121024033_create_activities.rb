class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|

      t.timestamps null: false
      t.belongs_to :brand, index: true
      t.belongs_to :user, index: true
      t.string :action
      t.string :involved_record

    end
  end
end
