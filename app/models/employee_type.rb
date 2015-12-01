class EmployeeType < ActiveRecord::Base
	has_many :employees
	belongs_to :dividend, class_name: 'Category', foreign_key: :dividend_id
end
