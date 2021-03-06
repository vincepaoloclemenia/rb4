class PurchaseOrderGeneratorController < ApplicationController
    include PurchaseOrderHelper
    before_action :authenticate_user!
    before_action :access_control
    before_action :restrict_branch_admins, if: :branch_admin?
    
    def index
        
    end

    def new
        @purchase_order = current_brand.purchase_orders.new
        @status = 'Approved'
		@suppliers = current_brand.suppliers.with_prices.pluck(:name, :id).uniq
        @numbers = []
        (1..12).each { |x| @numbers << [x, x] }
    end

    def get_pos
        if params[:id].present?
			@branch = Branch.find(params[:id])
			@pr_number = po_number_format(@branch)
            @po_number = @pr_number.gsub('PR', 'PO')
            @setup = @branch.branch_purchase_order_setup
            render json: { 
                po_number: @po_number, 
                pr_number: @pr_number, 
                from: @setup.nil? ? "" : @setup.delivery_from, 
                to: @setup.nil? ? "" : @setup.delivery_to,
                address: @setup.nil? ? "" : @setup.delivery_address
            }
                
		end
    end

    private

        def restrict_branch_admins
            flash[:alert] = "Access denied"
            redirect_to dashboard_path
        end

end