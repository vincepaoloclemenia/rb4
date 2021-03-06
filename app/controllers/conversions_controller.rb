class ConversionsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		@conversions = current_brand.conversions.paginate(page: params[:page], per_page: per_page)
	end

	def new
		@conversion = current_brand.conversions.new
	end

	def edit
		@conversion = current_brand.conversions.find(params[:id])
	end

	def create
		@conversion = current_brand.conversions.new(conversion_params)
		if @conversion.save
			flash[:notice] = "Conversion successfully created"
		else
			flash[:alert] = @conversion.errors.full_messages.join(", ")
		end
		redirect_to conversions_path
	end

	def update
		@conversion = current_brand.conversions.find(params[:id])
		if @conversion.update(conversion_params)
			flash[:notice] = "Conversion successfully updated"
		else
			flash[:alert] = @conversion.errors.full_messages.join(", ")
		end
		redirect_to conversions_path
	end

	def destroy
		@conversion = current_brand.conversions.find(params[:id])
		@conversion.destroy
		redirect_to conversions_path, notice: "Conversion successfully deleted"
	end

	private

	def conversion_params
		params.require(:conversion).permit(:from_unit_id, :to_unit_id, :factor, :is_active)
	end

	def per_page
		return 10 if params[:show].blank?
		params[:show].eql?('all') ? current_brand.units.not_deleted.count : params[:show]
	end
end