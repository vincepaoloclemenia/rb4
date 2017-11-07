class Api::SalesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_total_days, only: [:get_average_revenues, :get_sales_averages, :get_customer_count]
    
    def index        
        @sales = Branch.find(params[:branch_id]).sales.order(sale_date: :desc).paginate(page: params[:page], per_page: 5)
        #@sales = current_brand.sales.paginate(page: params[:page], per_page: 1)
    end

    def get_sales_averages
        @last_week_ave_sales =  current_brand.sales.any? || !current_user.brand.nil? ? current_brand.sales.where(sale_date: (Date.today.last_week + 1)..Date.today).pluck(:net_total_sales).sum / @last_week : 0                       
        @average_sales = current_brand.sales.any? || !current_user.brand.nil? ? current_brand.sales.pluck(:net_total_sales).sum / @total_days : 0        
    end

    def get_customer_count
        @customer_count = current_brand.sales.any? || !current_user.brand.nil? ? current_brand.sales.where(sale_date: current_brand.created_at.to_date..Date.today).pluck(:customer_count).sum / @total_days : 0 
        @last_week_count = current_brand.sales.any? || !current_user.brand.nil? ? current_brand.sales.where(sale_date: (Date.today.last_week - 1).. Date.today).map { |s| s.customer_count }.sum / @last_week : 0
        render json: { customer_count: @customer_count, average_count: @last_week_count }
    end

    def get_average_revenues
        @last_week_revenues = current_brand.sales.any? || !current_user.brand.nil? ? (@settlement_sales + current_brand.sales.pluck(:net_total_sales).sum + current_brand.sales.pluck(:vat).sum + current_brand.sales.pluck(:service_charge).sum) / @last_week : 0
        @average_revenues = current_brand.sales.any? || !current_user.brand.nil? ? (@settlement_sales + current_brand.sales.pluck(:net_total_sales).sum + current_brand.sales.pluck(:vat).sum + current_brand.sales.pluck(:service_charge).sum) / @total_days : 0
    end

    private
        def get_total_days
            @settlement_sales = current_brand.sales.any? || !current_user.brand.nil? ? current_brand.sales.map { |s| s.total_sales_by_settlement_type }.sum : 0  
            @last_week = ((Date.today - Date.today.last_week) - 1 ).to_i
            @total_days = current_brand.created_at.to_date == Date.today ? 1 : ( Date.today - current_brand.created_at.to_date ).to_i 
        end
end