class Api::SalesController < ApplicationController
    before_action :authenticate_user!
    
    def index        
        @sales = Branch.find(params[:branch_id]).sales.order(sale_date: :desc).paginate(page: params[:page], per_page: 5)
        #@sales = current_brand.sales.paginate(page: params[:page], per_page: 1)
    end

    def get_sales_averages
        current_brand.sales
    end

        
end