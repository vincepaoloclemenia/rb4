class BranchesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_brand
	before_action :set_branch, only: [:show, :edit, :update, :destroy]

	def show
	end

	def new
		@branch = Branch.new
	end

	def create
		@branch = @brand.branches.new(branch_params)
		if @branch.save
			flash[:notice] = "Branch successfully created"
		else
			flash[:alert] = @branch.errors.full_messages.join(", ")
		end
		redirect_to brand_path(id: @brand.id, brand_pane: true)
	end

	def update
		if @branch.update(branch_params)
			flash[:notice] = "Branch successfully updated"
		else
			flash[:alert] = @branch.errors.full_messages.join(", ")
		end
		redirect_to brand_path(id: @brand.id, brand_pane: true)
	end

	def show
		
	end

	def destroy
		begin
			@branch.destroy
			redirect_to brand_path(id: @brand.id, brand_pane: true), notice: "Branch successfully deleted"
		rescue ActiveRecord::InvalidForeignKey => e
			errors = []
			errors << "An unkonwn reason ( please kindly report to the developers for immediate fixing )" if errors.empty?
			puts e if errors.empty?
      redirect_to brand_path(id: @brand.id, brand_pane: true), alert: "You cannot delete #{@branch.name} because of the following #{'reason'.pluralize(errors.count)}: #{errors.join('; ')}"
    end
	end

	private

	def set_brand
		@brand = current_client.brands.find(params[:brand_id])
	end

	def set_branch
		@branch = @brand.branches.find(params[:id])
	end

	def branch_params
		if params["colorpicker-option-selected"]
			params[:branch][:color] = params["colorpicker-option-selected"]
		end
		params.require(:branch).permit(:name, :tin_number, :company_registered_name, :aka, :address1, :brand_id, :color, :city, :zip, :email_address, :landline_no, :mobile_no, :fax_no, :delivery_time)
	end
end