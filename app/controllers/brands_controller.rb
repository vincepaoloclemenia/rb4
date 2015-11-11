class BrandsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_brand, only: [:show, :edit, :update, :destroy]

	def index
		@brands = current_client.brands
	end

	def show
	end

	def new
		@brand = Brand.new
	end

	def create
		@brand = current_client.brands.new(brand_params)
		if @brand.save
			redirect_to brands_path, notice: "Brand sucessfully created"
		else
			flash[:alert] = @brand.errors.full_messages.join(", ")
			render 'new'
		end
	end

	def edit
	end

	def update
		if @brand.update(brand_params)
			redirect_to brands_path, notice: "Brand successfully updated"
		else
			flash[:alert] = @brand.errors.full_messages.join(", ")
			render 'edit'
		end
	end

	def destroy
		@brand.destroy
		redirect_to brands_path, notice: "Brand successfully deleted"
	end

	private

	def set_brand
		@brand = current_client.brands.find(params[:id])
	end

	def brand_params
		params.require(:brand).permit(:name, :website)
	end
end