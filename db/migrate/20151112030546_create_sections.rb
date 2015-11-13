class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :model_name
      t.string :page

      t.timestamps null: false
    end
  end
end
