class ClientsController < ApplicationController
	before_action :authenticate_user!

	def show
	end

	def update
		client = current_client
		if client.update(client_params)
			redirect_to client_path, notice: "Company successfully updated"
		else
			flash[:alert] = client.errors.full_messages.join(", ")
			render 'edit'
		end
	end

	private

	def client_params
		params.require(:client).permit(:name, :email, :address1, :contact)
	end
end