class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:edit, :destroy, :update]

  def index
    respond_to do |format|  
      if client_admin? || brand_admin?
        @branches = current_branches    
        @branch = @branches.find_by_id params[:branch_id]
        @employees = @branch.present? ? @branch.employees : []
        @message = @branch.present? && @branch.employees.empty? ? "No Employees set for #{@branch.name} yet" : "Please select branch first" 
        @empty_warning = @employees.empty? ? "block" : "none"  
        format.js     
        format.html     
      else
        @branch = current_user.branch
        @employees = @branch.employees
        @message = @employees.present? ? "" : "No employees set yet"
        @empty_warning = @employees.empty? ? "block" : "none"    
        format.js     
        format.html             
      end
    end
  end

  def new
    @branch = current_branches.find_by_id params[:branch_id] if client_admin? || brand_admin?
    @employee = branch_admin? ? current_user.branch.employees.new : current_brand.employees.new
    @employee.benefits.build
    @employee_benefits = current_brand.employee_benefits
  end

  def edit
    @employee_benefits = current_brand.employee_benefits
    @benefit = @employee.benefits.build
  end
  
  def show
    @employee = current_client.employees.find(params[:id])
  end

  def create
    obj = branch_admin? ? current_user.branch : current_brand
    @employee = obj.employees.new(employee_params)
    respond_to do |format|
      if @employee.save
        @employees = @employee.branch.employees
        @empty_warning = @employees.empty? ? "block" : "none"  
        @message = @branch.present? && @branch.employees.empty? ? "No Employees set for #{@branch.name} yet" : "Please select branch first"
        format.json { head :no_content }
        format.js { flash[:notice] = "Employee for #{@employee.branch.name} successfully created" }
      else
        @employees = @employee.branch.employees
        @empty_warning = @employees.empty? ? "block" : "none"  
        @message = @employees.empty? ? "No employees yet" : ""
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employees = @employee.branch.employees
    @empty_warning = @employees.empty? ? "block" : "none"      
    respond_to do |format|
      if @employee.destroy     
				format.json { head :no_content }
				format.js { flash[:notice] = "Employee has been deleted" }
			else
				format.json { render json: @employee.errors, status: :unprocessable_entity }
			end
		end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        @employees = @employee.branch.employees
        @empty_warning = @employees.empty? ? "block" : "none"  
        @message = @branch.present? && @branch.employees.empty? ? "No Employees set for #{@branch.name} yet" : "Please select branch first"
        format.json { head :no_content }
        format.js { flash[:notice] = "Employee for #{@employee.branch.name} successfully updated" }
      else
        @employees = @employee.branch.employees
        @empty_warning = @employees.empty? ? "block" : "none"  
        @message = @employees.empty? ? "No employees yet" : ""
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def labor_hours
    @labor_hour = LaborHour.new
    @labor_hour.labor_hours_entries.build
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(
        :branch_id, 
        :first_name, 
        :last_name, 
        :address, 
        :birthdate, 
        :age, 
        :contact_no, 
        :position, 
        :employee_type_id, 
        :position_type, 
        :date_employed, 
        benefits_attributes: [:id, :employee_benefit_id, :identification, :value, :name ]
      )
    end

    def per_page
      return 10 if params[:show].blank?
      params[:show].eql?('all') ? current_brand.units.not_deleted.count : params[:show]
    end
end
