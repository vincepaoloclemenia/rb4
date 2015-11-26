class LaborHour < ActiveRecord::Base
  belongs_to :employee
  has_many :labor_hours_entries
end