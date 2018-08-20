class TimesheetsController < ApplicationController
    before_action :authenticate_user!

    def index
        @branches = current_branches unless branch_admin?
        @holidays = current_brand.holidays.group_by(&:date)
        @date = params[:date] ? Date.parse(params[:date]) : Date.today
        @branch = branch_admin? ? current_user.branch : Branch.find_by_id(params[:branch_id])
        respond_to do |format|        
            format.js               
            format.html       
        end
    end

    def get_branch
        @branches = current_branches
        @date = Date.parse(params[:date])
    end

    def get_branch_employees
        @date = Date.parse(params[:date])
        @branch = branch_admin? ? current_user.branch : Branch.find(params[:branch_id])
    end

    def update_timesheets
        @branch = branch_admin? ? current_user.branch : Branch.find(params[:timesheet_id])
        @date = params[:date] ? Date.parse(params[:date]) : Date.today
        @holidays = current_brand.holidays.group_by(&:date)
        respond_to do |format|
            if @branch.update(branch_params)
                format.json { head :no_content }
                format.js { flash[:notice] = "Timesheets successfully saved" }
            else
                format.json { render json: @branch.errors, status: :unprocessable_entity }
            end
        end
    end

    def show_holiday
        @holiday = Holiday.find_by_id params[:holiday]
    end

    private

        def branch_params
            params.require(:branch).permit(
                employees_attributes: [
                    :id,
                    timesheets_attributes: [
                        :id,
                        :employee_id,
                        :date,
                        :regular_hours,
                        :overtime,
                        :night_differential,
                        :special_holiday,
                        :special_holiday_ot,
                        :legal_holiday,
                        :legal_holiday_ot,
                        :tardiness,
                        :_destroy
                    ]
                ]
            )
        end

end