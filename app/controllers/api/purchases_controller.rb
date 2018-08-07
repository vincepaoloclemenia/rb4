class Api::PurchasesController < ApplicationController
    before_action :get_user_privilege, only: [:index, :searched_purchases, :default_excel, :purchased_items]
    before_action :authenticate_user!
    before_action :set_branches, only: [:index, :purchased_items]

    def index
        @suppliers = current_brand.suppliers.select(:name, :id)
        @items = if params[:category].present?
                    current_brand.items.search_category(params[:category]).select(:name, :id)
                else
                    current_brand.items.select(:name, :id)
                end   
        @categories = current_brand.categories.where.not(parent_id: nil).select(:name, :id)
        @purchases = @user.purchases.where(purchase_date: Date.today.at_beginning_of_month..Date.today.end_of_month).with_purchase_items.paginate(page: params[:page], per_page: 15)        
    end

    def default_excel
        @purchases = @user.purchases.where(purchase_date: Date.today.at_beginning_of_month..Date.today.end_of_month).with_purchase_items 
        if params[:format] ==  "xlsx" && @purchases.present?             
            render xlsx: "Purchase List #{@purchases.last.purchase_date.strftime('%b %d, %Y')} - #{@purchases.first.purchase_date.strftime('%b %d, %Y')}", template: 'api/purchases/default_excel'
        elsif params[:format] == "pdf" && @purchases.present?  
            render template: 'api/purchases/default_excel', pdf: 'Purchase List', orientation: 'Landscape', :page_width   => '13in',
            :margin => {:top       => 15,
                         :bottom   => 15
                        }
        end
    end

    def searched_purchases
        purchases = @user.purchases.search_purchases(params[:suppliers], params[:branches], params[:invoice_number])                                 
        date = params[:date]
        @from = date.present? ? Date.strptime(date[0], "%m/%d/%Y") : purchases.last.purchase_date
        @to = date.present? ? Date.strptime(date[1], "%m/%d/%Y") : purchases.first.purchase_date
        @date = date.present? || purchases.size > 1 ? "#{@from.strftime('%B %d, %Y')} - #{@to.strftime('%B %d, %Y')}" : purchases.first.purchase_date.strftime("%B %d, %Y") 
        @purchases = if @from.nil? || @to.nil?
                        purchases
                    else    
                        if @user.purchases.search_purchases(params[:suppliers], params[:branches], params[:invoice_number]).where(purchase_date: @from..@to).exists?
                            @user.purchases.search_purchases(params[:suppliers], params[:branches], params[:invoice_number]).where(purchase_date: @from..@to)
                        else
                            []
                        end
                    end
        @items = params[:purchase_items]
        if params[:format] == 'xlsx' && @purchases.present?
            render xlsx: "Purchase List #{@purchases.last.purchase_date.strftime('%b %d, %Y')} - #{@purchases.first.purchase_date.strftime('%b %d, %Y')}", template: 'api/purchases/searched_purchases'
        elsif params[:format] == 'pdf' && @purchases.present?
            render template: 'api/purchases/searched_purchases', pdf: 'Purchase List', orientation: 'Landscape', :page_width   => '13in',
                :margin => {:top       => 15,
                             :bottom   => 15
                            }
        end  
    end

    def purchased_items
        @suppliers = current_brand.suppliers.select(:name, :id)
        @purchases = if params[:search].present?
            search = params[:search]              
            if search[:date].present?
                from = Date.strptime(search[:date][0], "%m/%d/%Y")
                to = Date.strptime(search[:date][1], "%m/%d/%Y")  
                if @user.purchases.where(purchase_date: from..to).exists? && ( search[:suppliers].present? || search[:branches].present? || search[:invoice].present? )
                    @user.purchases.search_purchases(search[:suppliers], search[:branches], search[:invoice]).where(purchase_date: from..to).paginate(page: params[:page], per_page: 20)
                else
                    @user.purchases.where(purchase_date: from..to).paginate(page: params[:page], per_page: 20)
                end
            else
                @user.purchases.search_purchases(search[:suppliers], search[:branches], search[:invoice]).paginate(page: params[:page], per_page: 20)                
            end
        else
            @user.purchases.paginate(page: params[:page], per_page: 20)
        end
    end

    def get_pos_for_purchasing
        @branch = Branch.find params[:branch_id]
        @purchase_orders = @branch.sent_approved_purchased_orders.select :po_number, :id
        render json: @purchase_orders
    end

    private
        
        def get_user_privilege
            @user = branch_admin? ? current_user.branch : current_brand
        end

        def set_branches
            @branches = current_client.on_free_trial? ? current_brand.branches.select(:name, :id) : current_brand.subscribed_branches.select(:name, :id)
        end

end