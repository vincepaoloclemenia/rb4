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
        @purchases = current_brand.purchases.with_purchase_items.paginate(page: params[:page], per_page: 15)
    end

    def searched_purchases
        @purchases = if params[:date].nil?
                        current_brand.purchases.search_purchases(params[:purchase_items], params[:suppliers], params[:branches], params[:invoice_number]).paginate(page: params[:page], per_page: 15)                                 
                    else
                        from = Date.strptime(params[:date][0], "%m/%d/%Y")
                        to = Date.strptime(params[:date][1], "%m/%d/%Y")        
                        if current_brand.purchases.search_purchases(params[:purchase_items], params[:suppliers], params[:branches], params[:invoice_number]).where(purchase_date: from..to).exists?
                            current_brand.purchases.search_purchases(params[:purchase_items], params[:suppliers], params[:branches], params[:invoice_number]).where(purchase_date: from..to).paginate(page: params[:page], per_page: 15)
                        else
                            []
                        end
                    end
        respond_to do |format|
            format.xlsx
            render xlsx: "Purchase List #{@purchases.last.purchase_date.strftime('%b %d, %Y')} - #{@purchases.frst.purchase_date.strftime('%b %d, %Y')}", template: 'api/timelogs/searched_purchases'
        end
    end

end