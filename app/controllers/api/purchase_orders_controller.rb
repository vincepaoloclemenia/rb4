class Api::PurchaseOrdersController < ApplicationController
    before_action :authenticate_user!
    def index
        @branches = current_brand.branches.map { |x| { label: x.name, value: x.id } }.to_a
        @suppliers = current_brand.suppliers.map { |x| { label: x.name, value: x.id } }.to_a
        @purchase_orders = current_brand.purchase_orders.where( po_date: Date.today.beginning_of_week..Date.today.end_of_week )
        @items = current_brand.items.all.map { |x| { label: x.name, value: x.id } }.to_a
    end

    def get_pos    
        @items  = params[:items]
        if params[:date].present?
            from = Date.strptime(params[:date][0], "%m/%d/%Y")
            to = Date.strptime(params[:date][1], "%m/%d/%Y") 
            @purchase_orders = current_brand.purchase_orders.where(po_date: from..to).dynamic_search(
                params[:po_number],
                params[:suppliers],
                params[:branches],
                params[:items],
                params[:status],
                params[:creator],     
            )
        else
            @purchase_orders = current_brand.purchase_orders.dynamic_search(
                params[:po_number],
                params[:suppliers],
                params[:branches],
                params[:items],
                params[:status],
                params[:creator],     
            )
        end
    end
end