class LaborHoursController < ApplicationController
  before_action :authenticate_user!
  before_action only: [:create]

  def index
  	@employees = current_client.employees
    generate_pdf
  end

  def generate_pdf
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "Labor Work Hours List",
                :orientation  => 'Landscape',
                :page_width   => '13in',
                :margin => {:top       => 1,
                             :bottom   => 1} 
      end
    end
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
    @employee = Employee.find(params[:labor_hour_id])
    generate_pdf
  end

  private
    def set_labor_hours
      @labor_hour = LaborHour.find(params[:id])
    end

    def labor_hour_entries_params
      params.require(:labor_hour).permit(:employee_id, labor_hours_entries_attributes: [:labor_hour_id, :working_date,:regular, :overtime, :night_differential, :legal_holiday, :special_holiday, :absent, :late, :rest_day])
    end
end