class BranchesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_branch, only: [:update, :destroy]

	def index
		@branches = current_brand.branches
		@branch = Branch.new
	end

	def create
		@branch = current_brand.branches.new(branch_params)
		if @branch.save
			flash[:notice] = "Branch successfully created"
		else
			flash[:alert] = @branch.errors.full_messages.join(", ")
		end
		redirect_to branches_path
	end

	def update
		if @branch.update(branch_params)
			flash[:notice] = "Branch successfully updated"
		else
			flash[:alert] = @branch.errors.full_messages.join(", ")
		end
		redirect_to branches_path
	end

	def destroy
		begin
			@branch.destroy
			redirect_to branches_path, notice: "Branch successfully deleted"
		rescue ActiveRecord::InvalidForeignKey => e
			errors = []
			errors << "An unkonwn reason ( please kindly report to the developers for immediate fixing )" if errors.empty?
			puts e if errors.empty?
      redirect_to branches_path, alert: "You cannot delete #{@branch.name} because of the following #{'reason'.pluralize(errors.count)}: #{errors.join('; ')}"
    end
	end

	private

	def set_branch
		@branch = current_brand.branches.find(params[:id])
	end

	def branch_params
		params.require(:branch).permit(:name, :address1, :brand_id)
	end
end