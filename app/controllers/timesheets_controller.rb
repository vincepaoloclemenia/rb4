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
        if @branch.update(branch_params)
            redirect_to timesheets_path, notice: "Timesheets successfully added"
        else
            redirect_to timesheets_path, alert: @branch.errors.full_messages.join(", ")
        end
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
                        :tardiness
                    ]
                ]
            )
        end

end