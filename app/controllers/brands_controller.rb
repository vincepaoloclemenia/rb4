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
			redirect_to brand_path(@brand), notice: "Brand sucessfully created"
		else
			flash[:alert] = @brand.errors.full_messages.join(", ")
			render 'new'
		end
	end

	def edit
	end

	def update
		if @brand.update(brand_params)
			redirect_to brand_path(@brand), notice: "Brand successfully updated"
		else
			flash[:alert] = @brand.errors.full_messages.join(", ")
			render 'edit'
		end
	end

	def destroy
		begin
			@brand.destroy
			redirect_to brands_path, notice: "Brand successfully deleted"
		rescue ActiveRecord::InvalidForeignKey => e
			errors = []
			errors << "#{'Branch'.pluralize(@brand.branches.count)}(#{@brand.branches.pluck(:name).join(', ')}) belongs to this brand" if @brand.branches.present?
			errors << "#{'Role'.pluralize(@brand.roles.count)}(#{@brand.roles.pluck(:name).join(', ')}) manages this brand" if @brand.roles.present?
      redirect_to brands_path, alert: "You cannot delete brand #{@brand.name} because of the following #{'reason'.pluralize(errors.count)}: #{errors.join('; ')}"
    end
	end

	private

	def set_brand
		@brand = current_client.brands.find(params[:id])
	end

	def brand_params
		params.require(:brand).permit(:name, :website)
	end
end