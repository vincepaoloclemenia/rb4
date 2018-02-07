class Api::PurchaseOrderSummaryController < ApplicationController
    before_action :authenticate_user!
    before_action :restrict_users_for_index, only: [ :index, :get_on_hold_pos, :get_rejected_pos ]
    before_action :restrict_users_for_get_purchase_orders, only: :get_purchase_orders
    def index
        @approved_purchase_orders = current_brand.purchase_orders.approved_pos.paginate(page: params[:page], per_page: 10)
        #@pending_pos = current_brand.purchase_orders.new_pos.paginate(page: params[:page], per_page: 10)
    end

    def get_on_hold_pos
        @on_hold_pos = current_brand.purchase_orders.on_hold_pos.paginate(page: params[:page], per_page: 10)
    end      
    
    def get_rejected_pos
        @rejected_pos = current_brand.purchase_orders.rejected_pos.paginate(page: params[:page], per_page: 10)        
    end        

    def get_purchase_orders 
        @purchase_orders = current_user.branch.purchase_orders.paginate(page: params[:page], per_page: 10)
    end

    private

        def restrict_users_for_index
            if current_user.role.role_level.eql? 'branch'
                redirect_to root_path
                flash[:alert] = 'Unauthorized user'
            end
        end

        def restrict_users_for_get_purchase_orders
            if current_user.role.role_level != 'branch'
                redirect_to root_path
                flash[:alert] = 'Unauthorized user'
            end
        end
end