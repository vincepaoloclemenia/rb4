class LaborHoursEntriesController < ApplicationController
  before_action :set_labor_hours_entry, only: [:edit, :update, :new, :create]
  def index
    @labor_hours_entries = LaborHoursEntry.where(labor_hours_id: params[:id])
    @employees = Employee.all
  end

  def edit
  end

  def new
  end

  def create
  end

  def destroy
  end

  private
    def set_labor_hours_entry
      @labor_hours_entry = LaborHoursEntry.find(params[:id])
    end

    def labor_hours_entry_params
      params.require(:labor_hours_entry).permit(:working_date,:regular, :overtime, :night_differential, :legal_holiday, :special_holiday, :absent, :late, :rest_day)
      # params.require(:labor_hours_entry).permit(labor_hours_entries_attributes: [:working_date,:regular, :overtime, :night_differential, :legal_holiday, :special_holiday, :absent, :late, :rest_day])
    end
end
