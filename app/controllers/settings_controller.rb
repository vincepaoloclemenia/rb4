class SettingsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_setting!

	def index
		@currency_list = ["Philippine Peso"]
		@theme_list = ["Default"]
		@language_list= ["English"]
	end

	def update_settings
		@setting.update(setting_params)
		redirect_to settings_path, notice: "Settings successfully updated"
	end

	def csrab_path
		#input send mail process here
		redirect_to settings_path, notice: "Message sent"
	end

	private
		def set_setting!
			@setting = current_settings
		end

		def setting_params
			params.require(:setting).permit(:theme, :currency, :language)
		end
end