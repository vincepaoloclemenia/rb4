class UnitsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :get_all, only: [:index, :create, :destroy]
	before_action :set_unit, only: [:edit, :update, :destroy]

	def index
	end

	def new
		@unit = current_brand.units.new
	end

	def edit
	end

	def create
		@unit = current_brand.units.new(unit_params)
		# if @unit.save
		# 	redirect_to units_path, notice: "Unit successfully created"
		# else
		# 	redirect_to units_path, alert: @unit.errors.full_messages.join(", ")
		# end

		respond_to do |format|
			if @unit.save
				format.json { head :no_content }
				format.js
				# @success = true
				# flash[:notice] = "Unit successfull created"
				# index
			else
				format.json { render json: @unit.errors,
														status: :unprocessable_entity }
				# @success = false
				# flash[:alert] = @unit.errors.full_messages.join(", ")
			end
		end
	end

	def update
		# if @unit.update(unit_params)
		# 	redirect_to units_path, notice: "Unit successfully updated"
		# else
		# 	redirect_to units_path, alert: @unit.errors.full_messages.join(", ")
		# end

		respond_to do |format|
			if @unit.update(unit_params)
				format.json { head :no_content }
				format.js
				# @success = true
				# flash[:notice] = "Unit successfull created"
				# index
			else
				format.json { render json: @unit.errors,
														status: :unprocessable_entity }
				# @success = false
				# flash[:alert] = @unit.errors.full_messages.join(", ")
			end
		end
	end

	def destroy
		# @unit.update(is_deleted: true)
		# redirect_to units_path, notice: "Unit successfully deleted"

		@unit.update(is_deleted: true)
		respond_to do |format|
			format.js
			format.html { redirect_to units_path }
			format.json { head :no_content }
		end
	end

	def unit_params
		params.require(:unit).permit(:name, :symbol, :remarks, :is_active, :track_as_sales)
	end

	def per_page
		params[:show].eql?('all') ? current_brand.purchases.count : params[:show]
		return 10 if params[:show].nil?
	end
	private
		def get_all
			@units = current_brand.units.not_deleted.paginate(page: params[:page], per_page: per_page)
		end

		def set_unit
			@unit = current_brand.units.find(params[:id])
		end
end