class SettlementsController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_settlement, only: [:update, :destroy]

	def index
		@settlements = current_client.settlements
		@settlement = Settlement.new
	end

	def create
		@settlement = current_client.settlements.new(settlement_params)
		if @settlement.save
			flash[:notice] = "Settlement successfully created"
		else
			flash[:alert] = @settlement.errors.full_messages.join(", ")
			# render 'new'
		end
		redirect_to settlements_path
	end

	def update
		if @settlement.update(settlement_params)
			flash[:notice] = "Settlement successfully updated"
		else
			flash[:alert] = @settlement.errors.full_messages.join(", ")
			# render 'edit'
		end
		redirect_to settlements_path
	end

	def destroy
		begin
			@settlement.destroy
			redirect_to settlements_path, notice: "Settlement successfully deleted"
		rescue ActiveRecord::InvalidForeignKey => e
			errors = []
			errors << "An unkonwn reason ( please kindly report to the developers for immediate fixing )" if errors.empty?
			puts e if errors.empty?
			redirect_to settlements_path, alert: "You cannot delete #{@settlement.name} because of the following #{'reason'.pluralize(errors.count)}: #{errors.join('; ')}"
		end
	end

	private

	def settlement_params
		params.require(:settlement).permit(:name, :is_complimentary, :client_id, :description, :is_active)
	end

	def set_settlement
		@settlement = current_client.settlements.find(params[:id])
	end
end