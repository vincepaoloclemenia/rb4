class LaborHour < ActiveRecord::Base
  belongs_to :employee
  has_many :labor_hours_entries
  accepts_nested_attributes_for :labor_hours_entries, reject_if: :all_blank, allow_destroy: true
end