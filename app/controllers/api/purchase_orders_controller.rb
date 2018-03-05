class Api::PurchaseOrdersController < ApplicationController
    before_action :authenticate_user!
    def index
        @branches = current_brand.branches.pluck(:name)
        @suppliers = current_brand.suppliers.pluck(:name)
        @purchase_orders = current_brand.purchase_orders     
    end

    def get_pos
        if (params[:from].present? && params[:to].present?) && !params[:term].present?
            @from = Date.strptime(params[:from], '%m/%d/%Y')
            @to = Date.strptime(params[:to], '%m/%d/%Y')
            @purchase_orders = current_brand.purchase_orders.where(po_date: @from..@to)
        elsif params[:term].present? && !( params[:from].present? & params[:to].present? )
            @purchase_orders = current_brand.purchase_orders.text_search(params[:term])    
        elsif params[:from].present? && params[:to].present? && params[:term].present?
            @from = Date.strptime(params[:from], '%m/%d/%Y')
            @to = Date.strptime(params[:to], '%m/%d/%Y')
            @purchase_orders = if current_brand.purchase_orders.where(po_date: @from..@to).exists? 
                current_brand.purchase_orders.where(po_date: @from..@to).text_search(params[:term])    
            else
                []
            end
        end
    end
end