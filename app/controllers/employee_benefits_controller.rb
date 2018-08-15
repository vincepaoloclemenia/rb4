class EmployeeBenefitsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_employee_benefit, only: [:edit, :update, :destroy ]

    def index
        @employee_benefits = current_brand.employee_benefits
        @empty_warning = current_brand.employee_benefits.empty? ? "block" : "none"
    end

    def new
        @employee_benefit = current_brand.employee_benefits.new
    end

    def create
        @employee_benefit = current_brand.employee_benefits.new(employee_benefit_params)
        respond_to do |format|
			if @employee_benefit.save
				format.json { head :no_content }
				format.js { flash[:notice] = "Employee benefit successfully created" }
			else
				format.json { render json: @employee_benefit.errors, status: :unprocessable_entity }
			end
		end
    end

    def edit

    end
    
    def update
        respond_to do |format|
			if @employee_benefit.update(employee_benefit_params)
				format.json { head :no_content }
				format.js { flash[:notice] = "Employee benefit successfully saved" }
			else
				format.json { render json: @employee_benefit.errors, status: :unprocessable_entity }
			end
		end
    end

    def destroy
        respond_to do |format|
			if @employee_benefit.destroy
				format.json { head :no_content }
				format.js { flash[:notice] = "Employee Benefit has been deleted" }
			else
				format.json { render json: @employee_benefit.errors, status: :unprocessable_entity }
			end
		end
    end

    private
        
        def set_employee_benefit
            @employee_benefit = current_brand.employee_benefits.find params[:id]
        end

        def employee_benefit_params
            params.require(:employee_benefit).permit(:name, :description, :active)
        end
end