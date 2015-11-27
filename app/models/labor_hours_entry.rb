class LaborHoursEntry < ActiveRecord::Base
	belongs_to :labor_hour
	belongs_to :branch
end
