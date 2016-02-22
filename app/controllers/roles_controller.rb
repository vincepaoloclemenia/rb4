class RolesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control
	before_action :set_role, only: [:show, :edit, :update, :destroy]

	def index
		@roles = current_client.roles.order('id asc')
	end

	def new
		@role = Role.new
	end

	def create
		@role = current_client.roles.new(role_params)
		if @role.save
			flash[:notice] = "Role successfully created"
		else
			flash[:alert] = @role.errors.full_messages.join(", ")
		end
		redirect_to roles_path
	end

	def update
		if @role.update(role_params)
			flash[:notice] = "Role successfully updated"
		else
			flash[:alert] = @role.errors.full_messages.join(", ")
		end
		redirect_to roles_path
	end

	def destroy
		begin
			@role.destroy
			redirect_to roles_path, notice: "Role successfully deleted"
		rescue ActiveRecord::InvalidForeignKey => e
			errors = []
			errors << "#{'User'.pluralize(@role.users)} assigned to it." if @role.users.present?
			errors << "An unkonwn reason ( please kindly report to the developers for immediate fixing )" if errors.empty?
			puts e if errors.empty?
			redirect_to roles_path, alert: "You cannot delete #{@role.name} because of the following #{'reason'.pluralize(errors.count)}: #{errors.join('; ')}"
		end
	end

	private

	def set_role
		@role = current_client.roles.find(params[:id])
	end

	def role_params
		params.require(:role).permit(:name, :description, :role_level)
	end
end