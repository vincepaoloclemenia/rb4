class PurchaseOrderGeneratorController < ApplicationController
    include PurchaseOrderHelper
    before_action :authenticate_user!
    before_action :access_control
    
    def index
        
    end

    def new
        @purchase_order = current_brand.purchase_orders.new
		@suppliers = (current_brand.suppliers.pluck(:name,:id) + current_brand.suppliers.pluck(:name,:id)).uniq
    end

    def get_pos
        if params[:id].present?
			@branch = Branch.find(params[:id])
			@pr_number = po_number_format(@branch)
            @po_number = @pr_number.gsub('PRN', 'PRO')
            render json: { po_number: @po_number, pr_number: @pr_number }
		end
    end

end