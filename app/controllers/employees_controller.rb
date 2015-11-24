class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:edit, :destroy, :update]
  
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
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
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :date_employed, :contact_no, :sss, :tin, :hdmf, :philhealth, :type)
    end
end
