class Timesheet < ActiveRecord::Base
    belongs_to :employee
    validates :date, presence: true, uniqueness: { scope: :employee_id }
end