class LaborHoursController < ApplicationController
  before_action :authenticate_user!
	before_action only: [:create]
  def index
  	# @labor_hours = LaborHour.all
    @employees = current_client.employees
  end

  def create
    @labor_hour = LaborHour.new(labor_hour_entries_params)
  	respond_to do |format|
      
      if @labor_hour.save
        format.html { redirect_to(labor_hours_path, :notice => 'Labor Hour entries was successfully created.') }
        format.xml  { render :xml => labor_hours_path, :status => :created, :location => @labor_hour }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @labor_hour.errors, :status => :unprocessable_entity }
      end
    end
  end

  def work_hours_list
    @labor_hours = LaborHour.where(employee_id: params[:labor_hour_id])
  end

  private
    def set_labor_hours
      @labor_hour = LaborHour.find(params[:id])
    end

    def labor_hour_entries_params
      params.require(:labor_hour).permit(:employee_id, labor_hours_entries_attributes: [:working_date,:regular, :overtime, :night_differential, :legal_holiday, :special_holiday, :absent, :late, :rest_day])
    end
end