class BranchesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_branch, only: [:show, :edit, :update, :destroy]

	def index
		@branches = current_brand.branches
	end

	def show
	end

	def new
		@branch = Branch.new
	end

	def create
		@branch = current_brand.branches.new(branch_params)
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
		@branch.destroy
		redirect_to branches_path, notice: "Branch successfully deleted"
	end

	private

	def set_branch
		@branch = current_brand.branches.find(params[:id])
	end

	def branch_params
		params.require(:branch).permit(:name, :address1)
	end
end