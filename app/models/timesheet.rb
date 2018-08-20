class Timesheet < ActiveRecord::Base
    default_scope -> { order date: :desc }
    belongs_to :employee
    validates :date, presence: true, uniqueness: { scope: :employee_id }
end