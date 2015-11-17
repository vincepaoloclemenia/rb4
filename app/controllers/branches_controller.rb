class BranchesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_branch, only: [:show, :edit, :update, :destroy]

	def index
		if current_user.role.role_level == "client"
			@branches = current_client.branches
		else
			@branches = current_brand.branches
		end
	end

	def show
	end

	def new
		@branch = Branch.new
	end

	def create
		@branch = Branch.new(branch_params)
		if @branch.save
			redirect_to branch_path(@branch), notice: "Branch successfully created"
		else
			flash[:alert] = @branch.errors.full_messages.join(", ")
			render 'new'
		end
	end

	def edit
	end

	def update
		if @branch.update(branch_params)
			redirect_to branch_path(@branch), notice: "Branch successfully updated"
		else
			flash[:alert] = @branch.errors.full_messages.join(", ")
			render 'edit'
		end
	end

	def destroy
		begin
			@branch.destroy
			redirect_to branches_path, notice: "Branch successfully deleted"
		rescue ActiveRecord::InvalidForeignKey => e
			errors = []
			errors << "An unkonwn reason ( please kindly report to the developers for immediate fixing )" if errors.empty?
			puts e if errors.empty?
      redirect_to brands_path, alert: "You cannot delete #{@branch.name} because of the following #{'reason'.pluralize(errors.count)}: #{errors.join('; ')}"
    end
	end

	private

	def set_branch
		@branch = current_client.branches.find(params[:id])
	end

	def branch_params
		params.require(:branch).permit(:name, :address1, :brand_id)
	end
end