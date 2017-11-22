class Api::EmployeesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_branch_id, only: :employees_per_branch

    def index
        @employees = current_client.employees.all.paginate(page: params[:page], per_page: 16)
    end

    def employees_per_branch
        @employees = @branch.employees.all
    end

    private

        def get_branch_id
            @branch = params[:branch_id].present? ? Branch.find(params[:branch_id]) : return nothing: true
        end
end