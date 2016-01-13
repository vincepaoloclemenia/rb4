class WizardsController < ApplicationController
	before_action :authenticate_user!
	skip_before_action :find_wizard_flag
	before_action :restrict_access

	def show
	end

	def user_setup
	end

	def user_setup_complete
		@user = current_user

		respond_to do |format|
			if params[:user][:first_name].blank?
				@user.errors.add(:first_name, "can't be blank")
			end

			if params[:user][:last_name].blank?
				@user.errors.add(:last_name, "can't be blank")
			end

			if @user.errors.present?
			else
				if @user.update(user_params)
					@user.update(flag: 2)
					ClientUserAccess.find_or_create_by user_id: @user.id
					#format.json { render json: @user.errors.full_messages.join(", "), status: :unprocessable_entity }
				end
			end
			format.js
		end
	end

	def company_setup
	end

	def company_setup_complete
		#current_client.update flag: 2
		#redirect_to brand_setup_wizard_path

		respond_to do |format|
			if client_create_or_update
				format.js
			else
				format.json { render json: @client.errors.full_messages.join(", "), status: :unprocessable_entity }
			end
		end
	end

	def client_create_or_update
		if current_user.client
			@client = current_user.client.update client_params
		else
			@client = Client.create client_params
			if @client.valid?
				current_user.client_user_access.update(client_id: @client.id)
				current_user.update(flag: 3)
			end
		end		
	end

	def brand_setup
	end

	def brand_setup_complete
		#current_client.update flag: 3
		# redirect_to branch_setup_wizard_path

		respond_to do |format|
			if brand_create_or_update
				format.js
			else
				format.json { render json: @brand.errors.full_messages.join(", "), status: :unprocessable_entity }
			end
		end
	end

	def brand_create_or_update
		if current_user.client.brands.present?
			@brand = current_user.client.brands.first.update brand_params
		else
			@brand = current_user.client.brands.create brand_params
			if @brand.valid?
				current_user.update(flag: 4)
			end
		end
	end

	def branch_setup
		
	end

	def branch_setup_complete
		#current_client.update flag: 4
		#redirect_to setup_summary_wizard_path
		
		respond_to do |format|
			branch_create_or_update
			if @errors.empty?
				format.js
			else
				format.json { render json: @errors.join(", "), status: :unprocessable_entity }
			end
		end
	end

	def branch_create_or_update
		brand = current_user.client.brands.first
		@errors = []
		branch_created_count = 0

		if brand.branches.empty?
			params[:branches].each_value do |value|
				if value[:name].present?
					brand.branches.create(name: value[:name], address1: value[:address1])
					branch_created_count += 1
				end
			end
			current_user.update(flag: 5)
		else
			existing_branch = []
			branch = []
			params[:branches].each do |key,value|
				if key.gsub(/([0-9])/, "") == "existing_branch"
					value[:id] = key.gsub("existing_branch","")
					existing_branch << value
				else
					branch << value
				end
			end

			branch.each do |b|
				if b[:name].present?
					brand.branches.create(name: b[:name], address1: b[:address1])
					branch_created_count += 1
				end
			end

			existing_branch.each do |eb|
				b = Branch.find(eb[:id])
				if eb[:name].present?
					b.update(name: eb[:name], address1: eb[:address1])
					branch_created_count += 1
				else
					b.destroy
				end
			end
		end
		@errors << "Please input at least 1 branch" if branch_created_count == 0
		current_user.update(flag: 5) if branch_created_count > 0
	end

	def setup_summary
		
	end

	def setup_summary_complete
		current_user.update(flag: 6)
		current_user.client_user_access.update(role_id: current_user.client.roles.first.id)
		#insert free trial subscription here
		redirect_to dashboard_path
	end

	private
	def restrict_access
		redirect_to root_path if current_user.flag >= 6
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name)
	end

	def client_params
		params.require(:client).permit(:name, :address1, :contact, :email)
	end

	def brand_params
		params.require(:brand).permit(:name, :website)
	end
end