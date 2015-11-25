class ShiftsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		@shifts = current_brand.shifts
		@shift = current_brand.shifts.new
	end

	def create
		@shift = current_brand.shifts.new(shift_params)
		if @shift.save
			redirect_to shifts_path, notice: "Shift successfully created"
		else
			redirect_to shifts_path, alert: @shift.errors.full_messages.join(", ")
		end
	end

	def update
		@shift = current_brand.shifts.find(params[:id])
		if @shift.update(shift_params)
			redirect_to shifts_path, notice: "Shift successfully updated"
		else
			redirect_to shifts_path, alert: @shift.errors.full_messages.join(", ")
		end
	end

	def destroy
		@shift = current_brand.shifts.find(params[:id])
		if @shift.destroy
			redirect_to shifts_path, notice: "Shift successfully deleted"
		else
			redirect_to shifts_path, alert: @shift.errors.full_messages.join(", ")
		end
	end

	private

	def shift_params
		params.require(:shift).permit(:name, :brand_id)
	end
end