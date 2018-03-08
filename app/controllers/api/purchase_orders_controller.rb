class Api::PurchaseOrdersController < ApplicationController
    before_action :authenticate_user!
    def index
        @branches = current_brand.branches.pluck(:name)
        @suppliers = current_brand.suppliers.pluck(:name)
        @purchase_orders = current_brand.purchase_orders.where( po_date: Date.today.beginning_of_week..Date.today.end_of_week )
        @items = current_brand.items.all.map { |x| { label: x.name, value: x.id } }.to_a
    end

    def get_pos    
        @searched_items = params[:items].present? ? params[:items] : ''
        @items = params[:items]
        @branches = params[:branch].present? ? params[:branch] : ''   
        @suppliers = params[:supplier].present? ? params[:supplier] : ''
        @status = params[:status].present? ? params[:status] : ''
        @creator = params[:creator].present? ? params[:creator] : ''
        @po_number = params[:po_number].present? ? params[:po_number] : ''
        @keywords = "#{@branches} #{@suppliers} #{@status} #{@creator} #{@po_number} #{@searched_items}"
        if params[:from].present? && params[:to].present? && !( params[:branch].present? || params[:supplier].present? || params[:creator].present? || params[:status].present? || params[:po_number].present? )
            @from = Date.strptime(params[:from], '%m/%d/%Y')   
            @to = Date.strptime(params[:to], '%m/%d/%Y')          
            @purchase_orders = current_brand.purchase_orders.where(po_date: @from..@to)
        elsif params[:from].present? && params[:to].present? && ( params[:branch].present? || params[:supplier].present? || params[:creator].present? || params[:status].present? || params[:po_number].present? )
            @from = Date.strptime(params[:from], '%m/%d/%Y')   
            @to = Date.strptime(params[:to], '%m/%d/%Y')   
            @purchase_orders = if current_brand.purchase_orders.where(po_date: @from..@to).exists?
                current_brand.purchase_orders.where(po_date: @from..@to).text_search(@keywords)
            else
                []
            end
        elsif !(params[:from].present? && params[:to].present?) && ( params[:items].present? || params[:branch].present? || params[:supplier].present? || params[:creator].present? || params[:status].present? || params[:po_number].present? )
            @purchase_orders = current_brand.purchase_orders.text_search(@keywords)
        end
    end
end