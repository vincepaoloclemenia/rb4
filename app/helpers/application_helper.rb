module ApplicationHelper
	def wizard_done?
		current_user.flag >= 6 ? true : false
	end
end
