class ChartsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_dates, only: [:get_dates, :get_average, :daily_sales, :get_dashboard_today]
    before_action :set_branch_and_date, only: [:sales_per_branch, :customer_count]
    before_action :get_colors, only: [:get_average]

    def daily_sales
        if params[:from].present? && params[:to].present?
            render json: current_brand.branches.includes(:sales).map { |branch| { name: branch.name, data: branch.sales.group_by_day(:sale_date, range: @from.to_s..@to.to_s).maximum(:net_total_sales) } }
        else    
            render json: current_brand.branches.includes(:sales).map { |branch| { name: branch.name, data: branch.sales.group_by_day_of_week(:sale_date, default_value: "missing", range: @from..@date_to, format: "%a" ).maximum(:net_total_sales) } }        
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
            @status = current_brand.sale_reports.where(title: "#{@from.strftime('%B %d, %Y')} - #{@to.strftime('%B %d, %Y')}").exists?
            render json: { label: @label, title: @title, existing: @status }
        else
            @today = "#{@from.strftime("%a, %b %d") } - #{Date.today.in_time_zone.at_end_of_week(end_day = :sunday).strftime("%a, %b %d") }"
            render json: { title: @today }
        end
    end

    def get_average
        @branches = current_brand.branches.includes(:sales)   
    end

    def get_dashboard_today
        render json: current_brand.sales.group_by_day_of_week(:sale_date, range: @from..@to, format: "%a").sum(:net_total_sales)
    end

    def yearly_sales
        render json: current_brand.sales.group_by_month_of_year(:sale_date, range: Date.today.in_time_zone.beginning_of_year..Date.today.in_time_zone, format: "%b").sum(:net_total_sales)
    end

    def today_sales_revenues_expenses
        render json: [{name: "Expenses", data: Hash[ Date.today.in_time_zone.strftime("%A, %b %d"), current_brand.purchase_items.where(date_of_purchase: Date.today.in_time_zone.to_date).pluck(:purchase_item_total_amount).sum ] },
                    { name: "Revenues", data: current_brand.sales.where(sale_date: Date.today.in_time_zone.to_date).group_by_day(:sale_date, range: Date.today.in_time_zone.to_date..Date.today.in_time_zone.to_date, format: '%A, %b %d').sum(:net_total_sales) }
                    ]
    end
    
    private
        def set_dates
            @from = params[:from].present? ? Date.strptime(params[:from], '%m/%d/%Y').in_time_zone.to_date : Date.today.in_time_zone.at_beginning_of_week(start_day = :sunday).to_date 
            @to = params[:to].present? ? Date.strptime(params[:to], '%m/%d/%Y').in_time_zone.to_date : Date.today.in_time_zone.to_date
            @date_to = Date.today.at_end_of_week(end_day = :sunday).strftime.in_time_zone.to_date
        end

        def set_branch_and_date
            if params[:br_id].present? && params[:start].present? && params[:end].present?
                @branch = Branch.find(params[:br_id])
                @date_from = params[:start]
                @date_to = params[:end]
            end
        end

        def get_colors
            @colours = current_brand.branches.all.map { |b| b.color }.to_a
        end
end