class BranchesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_branch, only: [:show, :edit, :update, :destroy]

	def index
		@branches = current_brand.branches
	end
end