class EmployeeTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_type, only: [:edit, :update, :destroy]
  
  def index
  	@employee_types = branch_admin? ? current_user.branch.employee_types : current_brand.employee_types
    @empty_warning = @employee_types.empty? ? "block" : "none"
  end

  def create
    @employee_type = current_brand.employee_types.new(employee_type_params)
    respond_to do |format|
      if @employee_type.save
        format.json { head :no_content }
        format.js { flash[:notice] = "Employee Type successfully created" }
      else
        format.json { render json: @employee_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @employee_type = current_brand.employee_types.new
  end

  def update
    respond_to do |format|
			if @employee_type.update(employee_type_params)
				format.json { head :no_content }
				format.js { flash[:notice] = "Employee Type successfully updated" }
			else
				format.json { render json: @employee_type.errors, status: :unprocessable_entity }
			end
		end
  end

  def edit
  end

  def destroy
    respond_to do |format|
			if @employee_type.destroy
				format.json { head :no_content }
				format.js { flash[:notice] = "Employee Type has been deleted" }
			else
				format.json { render json: @employee_type.errors, status: :unprocessable_entity }
			end
		end
  end

  private
    def set_employee_type
      @employee_type = EmployeeType.find(params[:id])
    end

    def employee_type_params
      params.require(:employee_type).permit(:name, :description, :brand_id)
    end
end
