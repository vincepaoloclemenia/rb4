class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :theme, default: "Default"
      t.string :currency, default: "Philippine Peso"
      t.string :language, default: "English"

      t.timestamps null: false
    end
  end
end
