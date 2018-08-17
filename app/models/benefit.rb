class Benefit < ActiveRecord::Base
  belongs_to :employee
  belongs_to :employee_benefit
end
