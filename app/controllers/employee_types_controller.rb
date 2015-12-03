class EmployeeTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_type, only: [:edit, :update, :destroy]
  
  def index
  	@employee_types = EmployeeType.all
    @employee_type = EmployeeType.new
    @category = Category.where(brand_id: current_brand.id).where(track_as_sales: true)
  end

  def create
    @employee_type = EmployeeType.new(employee_type_params)
    if @employee_type.save
      redirect_to employee_types_path(), notice: "Employee Type Created"
    else
      flash[:alert] = @employee_type.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def new
    @employee_type = EmployeeType.new
  end

  def update
    if @employee_type.update(employee_type_params)
      redirect_to employee_types_path(), notice: "Edit Successful"
    else
      flash[:alert] = @employee_type.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def destroy
    @employee_type = EmployeeType.find(params[:id])
    if @employee_type.present?
      @employee_type.destroy
    end
    redirect_to employee_types_path, notice: 'Successfully Deleted'
  end

  private
    def set_employee_type
      @employee_type = EmployeeType.find(params[:id])
    end

    def employee_type_params
      params.require(:employee_type).permit(:name, :description, :dividend_id)
    end
end
