class LaborHoursEntry < ActiveRecord::Base
	belongs_to :labor_hour
	belongs_to :branch

	# accepts_nested_attributes_for :labor_hours_entries	
end
