class Api::PurchaseOrdersController < ApplicationController
    before_action :authenticate_user!
    def index
        @branches = current_brand.branches.pluck(:name)
        @suppliers = current_brand.suppliers.pluck(:name)
        @purchase_orders = current_brand.purchase_orders.where( po_date: Date.today.beginning_of_week..Date.today.end_of_week )
        @items = current_brand.items.all.map { |x| { label: x.name, value: x.id } }.to_a
    end

    def get_pos    
        @items  = params[:items]
        @purchase_orders = current_brand.purchase_orders.dynamic_search(
            params[:from],
            params[:to],
            params[:items],
            params[:branch],
            params[:supplier],
            params[:status],
            params[:creator],
            params[:po_number]
        )
    end
end