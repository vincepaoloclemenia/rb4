class CategoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_category, only: [:edit, :update, :destroy]

	def index
		@categories = current_brand.categories.main
		@category = current_brand.categories.new
	end

	def show
	end

	def new
		@category = current_brand.categories.new
	end

	def create
		@category = current_brand.categories.new(category_params)
		if @category.save
			redirect_to categories_path, notice: "Category successfully created"
		else
			flash[:alert] = @category.errors.full_messages.join(", ")
			render 'new'
		end
	end

	def edit
	end

	def update
		if @category.update(category_params)
			redirect_to categories_path, notice: "Category successfully updated"
		else
			flash[:alert] = @category.errors.full_messages.join(", ")
			render 'edit'
		end
	end

	def destroy
		@category.destroy
		redirect_to categories_path, notice: "Category successfully deleted"
	end

	private

	def category_params
		params.require(:category).permit(:name, :description, :is_active, :brand_id, :track_as_sales, :parent_id)
	end

	def set_category
		@category = current_brand.categories.find(params[:id])
	end
end