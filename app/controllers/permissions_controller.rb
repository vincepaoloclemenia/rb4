class	PermissionsController < ApplicationController
	before_action :authenticate_user!

	def index
		@role = current_client.roles.find(params[:role_id])
		@permissions = @role.permissions.order('section_id')
	end

	def update
		@role = current_client.roles.find(params[:role_id])
		if @role.update(role_params)
			redirect_to role_path(@role), notice: "Permissions successfully updated"
		else
			redirect_to role_manage_permissions_path(role_id: @role.id), alert: @role.errors.full_messages.join(", ")
		end
	end

	private

	def role_params
		params.require(:role).permit(permissions_attributes: [:id, :is_create, :is_read, :is_update, :is_destroy])
	end
end