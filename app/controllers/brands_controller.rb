class BrandsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_brand, only: [:show, :edit, :update, :destroy]

	def index
		@brands = current_client.brands
	end

	def show
		@branches = @brand.branches
	end

	def new
		@brand = Brand.new
	end

	def create
		@brand = current_client.brands.new(brand_params)
		if @brand.save
			flash[:notice] = "Brand sucessfully created"
		else
			flash[:alert] = @brand.errors.full_messages.join(", ")
		end
		redirect_to brands_path
	end

	def update
		# respond_to do |format|
		# 	if @brand.update(brand_params)
		# 		@success = true
		# 		flash[:notice] = "Successfully updated"
		# 	else
		# 		@success = false
		# 		flash[:alert] = @brand.errors.full_messages.join(", ")
		# 	end
		# 	format.js
		# end
		if @brand.update(brand_params)
			redirect_to brand_path(@brand), notice: "Brand successfully updated"
		else
			redirect_to brand_path(@brand), alert: @brand.errors.full_messages.join(", ")
		end
	end

	def destroy
		begin
			if @brand.id == session[:current_brand_id].to_i
				session[:current_brand_id] = current_client.brands.first.id
				@brand.destroy
				redirect_to brands_path, notice: "Brand successfully deleted and switched to #{current_brand.name}"
			else
				@brand.destroy
				redirect_to brands_path, notice: "Brand successfully deleted"
			end
		rescue ActiveRecord::InvalidForeignKey => e
			errors = []
			errors << "#{'Branch'.pluralize(@brand.branches.count)}(#{@brand.branches.pluck(:name).join(', ')}) belongs to this brand" if @brand.branches.present?
			errors << "#{'Role'.pluralize(@brand.roles.count)}(#{@brand.roles.pluck(:name).join(', ')}) manages this brand" if @brand.roles.present?
			errors << "An unkonwn reason ( please kindly report to the developers for immediate fixing )" if errors.empty?
			puts e if errors.empty?
      redirect_to brands_path, alert: "You cannot delete brand #{@brand.name} because of the following #{'reason'.pluralize(errors.count)}: #{errors.join('; ')}"
    end
	end

	private

	def set_brand
		@brand = current_client.brands.find(params[:id])
	end

	def brand_params
		params.require(:brand).permit(:name, :website, :avatar, :description, :landline_no, :mobile_no, :fax_no)
	end
end
