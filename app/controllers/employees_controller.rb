class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:edit, :destroy, :update]

  def index
    @employees = Employee.all.paginate(page: params[:page], per_page: per_page)
    @employee = Employee.new
  end

  def new
    @employee = Employee.new
  end
  
  def show
    @employee = current_client.employees.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path(), notice: "Added Employee"
    else
      flash[:alert] = @employee.errors.full_messages.join(',')
      render 'new'
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: "Successfully Deleted"
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path(), notice: 'Edit Successful'
    else
      flash[:alert] = @employee.errors.full_messages.join(', ')
      render 'edit'
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
      params.require(:employee).permit(:branch_id, :first_name, :last_name, :address, :birthdate, :age, :contact_no, :position, :employee_type_id, :position_type, :date_employed, :end_date, :tin, :sss, :hdmf, :philhealth)
    end

    def per_page
      return 10 if params[:show].blank?
      params[:show].eql?('all') ? current_brand.units.not_deleted.count : params[:show]
    end
end
