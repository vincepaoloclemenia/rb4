class PurchasesController < ApplicationController
	before_action :authenticate_user!
	before_action :access_control

	def index
		get_total_purchases_per_branch
		@q = current_brand.purchases.ransack(params[:q])
		@purchases = if current_user.role.role_level.eql?('branch')
						current_user.branch.purchases.paginate(page: params[:page], per_page: per_page)
					else
						current_brand.purchases.paginate(page: params[:page], per_page: per_page)
					end
		@purchase = current_brand.purchases.new
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
	end

	def get_total_purchases_per_branch
		d = Date.today - 1 
		purchase_array = Array.new

		current_brand.branches.each_with_index do |branch, index|
			hash = Hash.new
			hash[:brand_name] = branch.name
			@branch_purchases = Purchase.where(branch_id: branch, brand_id: current_brand, purchase_date: d)
			hash[:total_purchases_amount] = get_total_purchases(@branch_purchases)
			purchase_array[index] = hash
		end
		return purchase_array
	end

	def get_total_purchases(purchases)
		total_amount = 0
		purchases.each do |purchase|
			purchase.purchase_items.each do |pi|
				total_amount += pi.purchase_item_total_amount
			end
		end
		return total_amount
	end

	def new
		@purchase = current_brand.purchases.new
		@suppliers = (current_client.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq		
	end

	def create
		@purchase = current_brand.purchases.create(purchase_params)
		@purchase.user_created_by_id = current_user.id
		if @purchase.save
			redirect_to purchase_purchase_items_path(@purchase.id)
			flash[:notice] = "Purchase was successfully created"
		else
			redirect_to purchases_path
			flash[:alert] = @purchase.errors.full_messages.join(', ')
		end
	end

	def update
		@purchase = current_brand.purchases.find(params[:id])
		respond_to do |format|
			if @purchase.update(purchase_params)
				@purchase.update(user_modified_by_id: current_user.id)
				index
				@success = true
				flash[:notice] = "Purchase successfully updated"
			else
				@success = false
				flash[:alert] = @purchase.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchases_path
	end

	def destroy
		@purchase = current_brand.purchases.find(params[:id])
		respond_to do |format|
			if @purchase.destroy
				index
				@success = true
				flash[:notice] = "Purchase successfully deleted"
			else
				@success = false
				flash[:alert] = @purchase.errors.full_messages.join(", ")
			end
			format.js
		end
		#redirect_to purchases_path, notice: "Purchase successfully deleted"
	end

	private

	def purchase_params
		if params[:purchase][:purchase_date].present?
			params[:purchase][:purchase_date] = Date.strptime(params[:purchase][:purchase_date], "%m/%d/%Y").to_s
		end
		params.require(:purchase).permit(:branch_id, :purchase_date, :invoice_number, :supplier_id)
	end

	def per_page
		params[:show].eql?('all') ? current_brand.purchases.count : params[:show]
		return 10 if params[:show].nil?
	end
end