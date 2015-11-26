class LaborHoursController < ApplicationController
  def index
  	@labor_hours = LaborHour.all
  end

end