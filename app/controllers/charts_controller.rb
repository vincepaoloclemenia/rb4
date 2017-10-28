class ChartsController < ApplicationController
    before_action :authenticate_user!

    def daily_sales
        if params[:from].present? && params[:to].present?
            @from = Date.strptime(params[:from], '%m/%d/%Y').to_s
            @to = Date.strptime(params[:to], '%m/%d/%Y').to_s
            render json: current_brand.branches.includes(:sales).map { |branch| { name: branch.name, library: { colors: [ branch.color ] }, data: branch.sales.group_by_day(:sale_date, range: @from..@to).maximum(:net_total_sales) } }
        else    
            @date_from = Date.today.at_beginning_of_week(start_day = :sunday).strftime
            @date_to = Date.today.at_end_of_week(end_day = :sunday).strftime
            render json: current_brand.branches.includes(:sales).map { |branch| { name: branch.name, data: branch.sales.group_by_day_of_week(:sale_date, default_value: "missing", range: @date_from..@date_to, format: "%a" ).maximum(:net_total_sales) } }        
        end
    end

    def sales_per_branch
        branch = Branch.find(params[:br_id])
        date_from = params[:start]
        date_to = params[:end]
        render json: branch.sales.group_by_day_of_week(:sale_date, default_value: "No Data Yet", range: date_from..date_to, format: "%a").maximum(:net_total_sales), min: 1, max: 100000
    end

    def get_dates
        @from = Date.strptime(params[:from], '%m/%d/%Y')
        @to = Date.strptime(params[:to], '%m/%d/%Y')
        @total_num_of_days = (@to - @from).to_i
        @label = "Sales from: #{@from.strftime('%b %d, %Y')} to #{@to.strftime('%b %d,%Y')} (#{@total_num_of_days} days)"
        @title = "Average Sales Per Date Range (#{@from.strftime('%b %d, %Y')} - #{@to.strftime('%b %d,%Y')} = #{@total_num_of_days} days)"
        render json: { label: @label, title: @title }
    end

    def get_average
        @from = params[:from].present? ? Date.strptime(params[:from], '%m/%d/%Y') : Date.today.at_beginning_of_week(start_day = :sunday)
        @to = params[:to].present? ? Date.strptime(params[:to], '%m/%d/%Y') : Date.today.at_end_of_week(end_day = :sunday)
        @branches = current_brand.branches.includes(:sales)   
    end

end