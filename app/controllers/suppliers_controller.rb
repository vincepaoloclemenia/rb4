class SuppliersController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		@suppliers = current_client.suppliers.not_deleted
		@suppliers = if params[:search]
			current_brand.suppliers.search(params[:search])
		else
			@suppliers = current_client.suppliers.not_deleted
		end
	end

	def new
		@supplier = current_client.suppliers.new
		@items = current_brand.filtered_items
		
	end

	def edit
		@supplier = current_client.suppliers.not_deleted.find(params[:id])
		@items = current_brand.filtered_items
	end

	def create
		@supplier = current_client.suppliers.new(supplier_params)
		if @supplier.save
			flash[:notice] = "Supplier successfully created"
		else
			flash[:alert] = @supplier.errors.full_messages.join(", ")
		end
		redirect_to suppliers_path
	end

	def update
		@supplier = current_client.suppliers.find(params[:id])
		if @supplier.update(supplier_params)
			flash[:notice] = "Supplier successfully updated"
		else
			flash[:alert] = @supplier.errors.full_messages.join(", ")
		end
		redirect_to suppliers_path
	end

	def destroy
		@supplier = current_client.suppliers.find(params[:id])
		@supplier.destroy
		redirect_to suppliers_path, notice: "Supplier successfully deleted"
	end

	private

	def supplier_params
		params.require(:supplier).permit(:name, :address, :contact_person, :contact_title, :tin, :mobile_no, :fax_no, :landline_no,
																		:is_active, :assigned_to, :brand_id, :branch_id, item_ids: [])
	end
end