class CategoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_category, only: [:edit, :update, :destroy]

	def index
		@categories = current_brand.categories.main.order('name ASC')
		# @category = current_brand.categories.new
	end

	def edit
	end

	def new
		if params[:category_id]
			@category = current_brand.categories.new(parent_id: params[:category_id])
		else
			@category = current_brand.categories.new
		end
	end

	def new_subcategory
		@category = current_brand.categories.new(parent_id: params[:category_id])
	end

	def create
		@category = current_brand.categories.new(category_params)
		
		respond_to do |format|
			if @category.save
				format.json { head :no_content }
				format.js { flash[:notice] = "Category successfully created" }
			else
				format.json { render json: @category.errors,
														status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @category.update(category_params)
				format.js { flash[:notice] = "Category successfully updated" }
				format.json { head :no_content }
			else
				format.json { render json: @category.errors,
														status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@category_id = @category.id
		begin
			@category.destroy

			respond_to do |format|
				format.js { flash[:notice] = "Category successfully deleted" }
				format.html { redirect_to categories_path, notice: "Category successfully deleted" }
				format.json { head :no_content }
			end
		rescue ActiveRecord::InvalidForeignKey => e
			@errors = []
			if @category.is_subcategory?
				@errors << "Can not be deleted, There are attached items to this category. Items: #{@category.items.pluck(:name).join(', ')}"
			else
				subcats = {}
				@category.subcategories.each do |s|
					unless s.items.empty?
						subcats[s.name.to_s] = s.items.pluck(:name)
					end
				end
				subcats_with_error = []
				subcats.each do |key, value|
					subcats_with_error << "\"#{key}\" => #{value.join(', ')}"
				end
				@errors << "This category have subcategories that are attached to items: #{subcats_with_error.join(', ')}"
			end
			respond_to do |format|
				format.js { flash[:alert] = @errors.join(', ') }
				format.html { redirect_to categories_path, alert: @errors.join(', ') }
				format.json { head :no_content }
			end
		end
	end

	private

	def category_params
		params.require(:category).permit(:name, :description, :is_active, :brand_id, :track_as_sales, :parent_id)
	end

	def set_category
		@category = current_brand.categories.find(params[:id])
	end
end