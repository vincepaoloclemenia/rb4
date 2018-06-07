class Api::PurchaseOrderSummaryController < ApplicationController
    before_action :authenticate_user!
    before_action :restrict_users_for_index, only: [ :index, :get_on_hold_pos, :get_rejected_pos ]
    before_action :restrict_users_for_get_purchase_orders, only: :get_purchase_orders
    def index
        @approved_purchase_orders = if params[:search].present? 
                                        q = params[:search]
                                        if q[:date].present?
                                            from = Date.strptime(q[:date][0], "%m/%d/%Y")
                                            to = Date.strptime(q[:date][1], "%m/%d/%Y") 
                                            current_brand.purchase_orders.where( po_date: from..to ).dynamic_search('', q[:supplier], q[:branch], [], '' ,'').paginate(page: params[:page], per_page: 20)                                            
                                        else
                                            current_brand.purchase_orders.dynamic_search('', q[:supplier], q[:branch], [], '' ,'').paginate(page: params[:page], per_page: 20)
                                        end
                                    else
                                        current_brand.purchase_orders.approved_pos.paginate(page: params[:page], per_page: 20)
                                    end
        @branches = current_brand.branches.select :name, :id
        @suppliers = current_brand.suppliers.select :name, :id
    end

    def get_on_hold_pos
        @on_hold_pos = current_brand.purchase_orders.on_hold_pos.paginate(page: params[:page], per_page: 20)
    end      
    
    def get_rejected_pos
        @rejected_pos = current_brand.purchase_orders.rejected_pos.paginate(page: params[:page], per_page: 20)        
    end        

    def get_purchase_orders 
        @purchase_orders = current_user.branch.purchase_orders.paginate(page: params[:page], per_page: 20)
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