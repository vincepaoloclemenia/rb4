class TimesheetFieldsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_timesheet_field, only: [:edit, :update, :destroy]

    def index
        @timesheet_fields = current_brand.timesheet_fields
        @empty_warning = @timesheet_fields.empty? ? "block" : "none"
    end
  
    def create
      @timesheet_field = current_brand.timesheet_fields.new(timesheet_field_params)
      respond_to do |format|
        if @timesheet_field.save
          format.json { head :no_content }
          format.js { flash[:notice] = "Timsheet Field successfully created" }
        else
          format.json { render json: @timesheet_field.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def new
      @timesheet_field = current_brand.timesheet_fields.new
    end
  
    def update
      respond_to do |format|
              if @timesheet_field.update(timesheet_field_params)
                  format.json { head :no_content }
                  format.js { flash[:notice] = "Timsheet Field successfully updated" }
              else
                  format.json { render json: @timesheet_field.errors, status: :unprocessable_entity }
              end
          end
    end
  
    def edit
    end
  
    def destroy
      respond_to do |format|
              if @timesheet_field.destroy
                  format.json { head :no_content }
                  format.js { flash[:notice] = "Timsheet Field has been deleted" }
              else
                  format.json { render json: @timesheet_field.errors, status: :unprocessable_entity }
              end
          end
    end
  
    private

        def set_timesheet_field
            @timesheet_field = TimesheetField.find(params[:id])
        end

        def timesheet_field_params
            params.require(:timesheet_field).permit(:id, :name, :description, :is_active )
        end

end