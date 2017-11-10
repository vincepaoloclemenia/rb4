class Api::SaleReportsController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    before_action :authenticate_user!
    before_action :get_dates, only: :create

    def create
        @title = "#{Date.strptime(@from, '%m/%d/%Y').strftime('%B %d, %Y')} - #{Date.strptime(@to, '%m/%d/%Y').strftime('%B %d, %Y')}"
        @sale_report = current_user.sale_reports.create( title: @title, from: Date.strptime(@from, '%m/%d/%Y'), to: Date.strptime(@to, '%m/%d/%Y'), brand_id: current_brand.id, total_sales: current_brand.sales.where(sale_date: Date.strptime(@from, '%m/%d/%Y')..Date.strptime(@to, '%m/%d/%Y')).pluck(:net_total_sales).sum, num_of_days: (Date.strptime(@to, '%m/%d/%Y') - Date.strptime(@from, '%m/%d/%Y')).to_i )
        render json: { saleReport: @sale_report, status: 200 }        
    end

    private
        def get_dates            
            @from = params[:from]
            @to = params[:to]
        end
        
end