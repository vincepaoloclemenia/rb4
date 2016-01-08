class UnitsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		@units = current_brand.units.not_deleted.paginate(page: params[:page], per_page: per_page)
		@unit = current_brand.units.new
	end

	def create
		@unit = current_brand.units.new(unit_params)
		if @unit.save
			redirect_to units_path, notice: "Unit successfully created"
		else
			redirect_to units_path, alert: @unit.errors.full_messages.join(", ")
		end
	end

	def update
		@unit = current_brand.units.find(params[:id])
		if @unit.update(unit_params)
			redirect_to units_path, notice: "Unit successfully updated"
		else
			redirect_to units_path, alert: @unit.errors.full_messages.join(", ")
		end
	end

	def destroy
		@unit = current_brand.units.find(params[:id])
		@unit.update(is_deleted: true)
		redirect_to units_path, notice: "Unit successfully deleted"
	end

	private
		def unit_params
			params.require(:unit).permit(:name, :symbol, :remarks, :is_active, :track_as_sales)
		end

		def per_page
			params[:show].eql?('all') ? current_brand.purchases.count : params[:show]
			return 10 if params[:show].nil?
		end
end