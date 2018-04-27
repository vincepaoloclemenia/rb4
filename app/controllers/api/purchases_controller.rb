class Api::PurchasesController < ApplicationController

    def index
        @suppliers = current_brand.suppliers.select(:name, :id)
        @items = if params[:category].present?
                    current_brand.items.search_category(params[:category]).select(:name, :id)
                else
                    current_brand.items.select(:name, :id)
                end
        @branches = current_brand.branches.select(:name, :id)
        @categories = current_brand.categories.where.not(parent_id: nil).select(:name, :id)
        @purchases = current_brand.purchases.where(purchase_date: Date.today.at_beginning_of_month..Date.today.end_of_month).with_purchase_items.paginate(page: params[:page], per_page: 15)
        if params[:format] == 'xlsx' 
            render xlsx: "Purchase List #{@purchases.last.purchase_date.strftime('%b %d, %Y')} - #{@purchases.first.purchase_date.strftime('%b %d, %Y')}", template: 'api/purchases/index'
        end      
    end

    def searched_purchases
        @purchases = if params[:date].nil?
                        current_brand.purchases.search_purchases(params[:suppliers], params[:branches], params[:invoice_number])                                 
                    else
                        from = Date.strptime(params[:date][0], "%m/%d/%Y")
                        to = Date.strptime(params[:date][1], "%m/%d/%Y")        
                        if current_brand.purchases.search_purchases(params[:suppliers], params[:branches], params[:invoice_number]).where(purchase_date: from..to).exists?
                            current_brand.purchases.search_purchases(params[:suppliers], params[:branches], params[:invoice_number]).where(purchase_date: from..to)
                        else
                            []
                        end
                    end
        @items = params[:purchase_items]
    end

end