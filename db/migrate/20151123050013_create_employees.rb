class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.belongs_to :branch, index: true, foreign_key: true
      t.belongs_to :employee_type, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :date_employed
      t.integer :job_id
      t.date :birthdate
      t.string :contact_no
      t.string :sss
      t.string :tin
      t.text :address
      t.string :hdmf
      t.integer :age
      t.string :philhealth
      t.string :position
      t.string :position_type
      t.date :end_date

      t.timestamps null: false
    end
  end
end
