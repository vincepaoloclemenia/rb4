class Employee < ActiveRecord::Base
  belongs_to :branch
  belongs_to :employee_type
  delegate :brand, to: :branch
  has_many :labor_hours
  has_many :labor_hours_entries, through: :labor_hours

  validates_presence_of :branch_id, :employee_type_id, :first_name, :last_name

  def full_name
    if first_name.present? && last_name.present?
      first_name + " " + last_name
    else
      first_name
    end
  end
end
