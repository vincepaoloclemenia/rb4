class Api::DashboardsController < ApplicationController

    def index
        @sales = if branch_admin?
                    current_user.branch.sales.where(sale_date: Date.today).map(&:net_total_sales).sum.round(2).to_s      
                else   
                    current_brand.sales.where(sale_date: Date.today).map(&:net_total_sales).sum.round(2).to_s
                end

        @expenses = if branch_admin?                       
                        current_user.branch.purchase_items.includes(:purchase).where( purchases: { purchase_date: Date.today } ).map(&:item_total_net).sum.round(2).to_s
                    else                    
                        current_brand.purchase_items.includes(:purchase).where( purchases: { purchase_date: Date.today } ).map(&:item_total_net).sum.round(2).to_s                        
                    end
    end

    def this_week_sales_vs_expense
        @sales = if branch_admin?
                    current_user.branch.sales.display_this_weeks_sales_per_day   
                else   
                    current_brand.sales.display_this_weeks_sales_per_day
                end

        @expenses = if branch_admin?                       
                    current_user.branch.purchases.get_all_by_week
                else                    
                    current_brand.purchases.get_all_by_week                      
                end
    end
end