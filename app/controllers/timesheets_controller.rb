class TimesheetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @holidays = current_brand.holidays.group_by(&:date)
        @date = params[:date] ? Date.parse(params[:date]) : Date.today
        respond_to do |format|        
            format.js               
            format.html       
        end
    end

end