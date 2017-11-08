class Api::SalesController < ApplicationController
    before_action :authenticate_user!
    
    def index        
        @sales = Branch.find(params[:branch_id]).sales.order(sale_date: :desc).paginate(page: params[:page], per_page: 5)
        #@sales = current_brand.sales.paginate(page: params[:page], per_page: 1)
    end

    def get_sales_averages
        @last_week_ave_sales =  current_brand.get_sales_average                      
        @average_sales = current_brand.last_week_sales     
    end

    def get_customer_count
        @customer_count = current_brand.customer_count_average
        @last_week_count = current_brand.last_week_customer_count
        render json: { customer_count: @customer_count, average_count: @last_week_count }
    end

    def get_average_revenues
        @last_week_revenues = current_brand.average_revenues("last_week")
        @average_revenues = current_brand.average_revenues("daily")
    end

end