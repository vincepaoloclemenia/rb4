module ReportsHelper

	def price_movement(previous_amount, current_amount)
		upper_amount = current_amount - previous_amount
		if previous_amount > current_amount
			return "- " + to_peso(upper_amount)
		else
			return "+ " + to_peso(upper_amount)
		end
	end
end