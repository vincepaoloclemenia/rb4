class ChartsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_dates, only: [:get_dates, :get_average, :daily_sales, :get_dashboard_today]
    before_action :set_branch_and_date, only: [:sales_per_branch, :customer_count]

    def daily_sales
        colours = current_brand.branches.map { |b| [b.id, b.color] }.to_h
        if params[:from].present? && params[:to].present?
            render json: current_brand.branches.includes(:sales).map { |branch| { name: branch.name, data: branch.sales.group_by_day(:sale_date, range: @from.to_s..@to.to_s).maximum(:net_total_sales) } }
        else    
            render json: current_brand.branches.includes(:sales).map { |branch| { name: branch.name, data: branch.sales.group_by_day_of_week(:sale_date, default_value: "missing", range: @from.strftime..@date_to, format: "%a" ).maximum(:net_total_sales) } }        
        end
    end

    def sales_per_branch
        render json: @branch.sales.group_by_day_of_week(:sale_date, default_value: "No Data Yet", range: @date_from..@date_to, format: "%a").maximum(:net_total_sales)
    end

    def customer_count        
        render json: @branch.sales.group_by_day_of_week(:sale_date, default_value: "No Data Yet", range: @date_from..@date_to, format: "%a").maximum(:customer_count)
    end

    def get_dates
        if params[:from].present? && params[:to].present?
            @total_num_of_days = (@to - @from).to_i
            @label = "Sales from: #{@from.strftime('%b %d, %Y')} to #{@to.strftime('%b %d,%Y')} (#{@total_num_of_days} days)"
            @title = "Average Sales Per Date Range (#{@from.strftime('%b %d, %Y')} - #{@to.strftime('%b %d,%Y')} = #{@total_num_of_days} days)"
            render json: { label: @label, title: @title }
        else
            @today = "#{@from.strftime("%a, %b %d") } - #{Date.today.at_end_of_week(end_day = :sunday).strftime("%a, %b %d") }"
            render json: { title: @today }
        end
    end

    def get_average
        @branches = current_brand.branches.includes(:sales)   
    end

    def get_dashboard_today
        render json: current_brand.sales.group_by_day(:sale_date, format: "%a", range: @from..@to).sum(:net_total_sales)
    end

    private
        def set_dates
            @from = params[:from].present? ? Date.strptime(params[:from], '%m/%d/%Y') : Date.today.at_beginning_of_week(start_day = :sunday) 
            @to = params[:to].present? ? Date.strptime(params[:to], '%m/%d/%Y') : Date.today
            @date_to = Date.today.at_end_of_week(end_day = :sunday).strftime
        end

        def set_branch_and_date
            if params[:br_id].present? && params[:start].present? && params[:end].present?
                @branch = Branch.find(params[:br_id])
                @date_from = params[:start]
                @date_to = params[:end]
            end
        end
end