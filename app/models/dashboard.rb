class Dashboard < ActiveRecord::Base

	def self.display_value
		puts "print this task"
	end

	def self.update_customer_count
		@date = Date.today-1
	end
end
