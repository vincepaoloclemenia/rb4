class Plan < ActiveRecord::Base
	has_many :subscriptions

	def period_without_ly
		if ["monthly","yearly"].include?(period)
			period.eql?("monthly") ? "month" : "year"
		else
			period
		end
	end
end
