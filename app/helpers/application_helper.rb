module ApplicationHelper
	def wizard_done?
		current_user.flag >= 6 ? true : false
	end

	def to_peso(num)
		num = 0 if num == 0 || num.nil?
		number_to_currency(num, unit: "PhP ")
	end
end
