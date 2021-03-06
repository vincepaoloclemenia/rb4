class Employee < ActiveRecord::Base

  default_scope -> { order last_name: :asc }
  belongs_to :branch
  belongs_to :employee_type
  delegate :brand, to: :branch
  has_many :benefits, dependent: :destroy
  has_many :labor_hours
  has_many :labor_hours_entries, through: :labor_hours
  has_many :timesheets, dependent: :destroy
  accepts_nested_attributes_for :timesheets, allow_destroy: true, reject_if: proc { |ts| ts["regular_hours"] == "" && ts["night_differential"] == "" && ts["special_holiday"] == "" && ts["special_holiday_ot"] == "" && ts["legal_holiday_ot"] == "" && ts["legal_holiday"] == "" && ts["tardiness"] == "" && ts["overtime"] == "" }                       
  accepts_nested_attributes_for :benefits, :allow_destroy => :true, reject_if: proc { |ben| ben["identification"].nil? || ben["value"].nil? || ben["value"].to_i == 0 }
  
  #before_save :parse_date

  validates_presence_of :branch_id, :employee_type_id, :first_name, :last_name

  def full_name
    if first_name.present? && last_name.present?
      first_name + " " + last_name
    else
      first_name
    end
  end
end
