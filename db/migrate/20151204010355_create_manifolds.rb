class CreateManifolds < ActiveRecord::Migration
  def change
    create_table :manifolds do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.string :name
      t.string :description
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
