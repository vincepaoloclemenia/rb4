class Api::SaleReportsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    before_action :authenticate_user!
    before_action :get_dates, only: :create

    def create
        if current_brand.sales.where(sale_date: Date.strptime(@from, '%m/%d/%Y')..Date.strptime(@to, '%m/%d/%Y')).exists?
            @title = "#{Date.strptime(@from, '%m/%d/%Y').strftime('%B %d, %Y')} - #{Date.strptime(@to, '%m/%d/%Y').strftime('%B %d, %Y')}"
            @sale_report = current_brand.sale_reports.where( title: @title, date_from: Date.strptime(@from, '%m/%d/%Y'), date_to: Date.strptime(@to, '%m/%d/%Y'), total_sales: current_brand.sales.where(sale_date: Date.strptime(@from, '%m/%d/%Y')..Date.strptime(@to, '%m/%d/%Y')).pluck(:net_total_sales).sum, num_of_days: (Date.strptime(@to, '%m/%d/%Y') - Date.strptime(@from, '%m/%d/%Y')).to_i ).first_or_create
            render json: { saleReport: @sale_report, status: 200 }
        else
            @title = "#{Date.strptime(@from, '%m/%d/%Y').strftime('%B %d, %Y')} - #{Date.strptime(@to, '%m/%d/%Y').strftime('%B %d, %Y')}"
            render json: {saleReport: false, status: 200, title: @title }
        end        
    end

    private
        def get_dates            
            @from = params[:from]
            @to = params[:to]
        end
        
end