class Api::DashboardsController < ApplicationController
    before_action :authenticate_user!

    def index
        @sales = if branch_admin?
                    sale = current_user.branch.sales.find_by_sale_date(Date.today)
                    sale.present? ? sale.net_total_sales : 0.0
                else   
                    current_brand.sales.where(sale_date: Date.today).map(&:net_total_sales).sum.round(2)
                end

        @expenses = if branch_admin?                       
                        purchase = current_user.branch.purchases.includes(:purchase_items).find_by_purchase_date(Date.today)
                        purchase.present? ? purchase.purchase_items.map(&:item_total_net).sum.round(2) : 0.0
                    else                    
                        current_brand.purchase_items.includes(:purchase).where( purchases: { purchase_date: Date.today } ).map(&:item_total_net).sum.round(2)                        
                    end
    end

    def this_week_sales_vs_expense
        @sales = if branch_admin?
                    current_user.branch.sales.get_all_by_week_for_branch   
                else   
                    current_brand.sales.get_all_by_week
                end

        @expenses = if branch_admin?                       
                    current_user.branch.purchases.get_all_by_week_for_branch
                else                    
                    current_brand.purchases.get_all_by_week                      
                end
    end

    def this_years_sales_expense
        @sales = branch_admin? ? current_user.branch.sales.get_all_by_month : current_brand.sales.get_all_by_month
        @expenses = branch_admin? ? current_user.branch.purchases.get_all_by_month : current_brand.purchases.get_all_by_month
    end

    def monthly_sales_average
        @object = branch_admin? ? current_user.branch : current_brand
    end

    def monthly_customer_count_average
        @object = branch_admin? ? current_user.branch : current_brand
    end

    def this_year_total_sales
        @object = branch_admin? ? current_user.branch : current_brand
    end

    def get_branches_ranking
        
    end

end