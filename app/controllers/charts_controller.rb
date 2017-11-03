class ChartsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_dates, only: [:get_dates, :get_average, :daily_sales]

    def daily_sales
        colours = current_brand.branches.all.map { |b| [b.id, b.color] }.to_h
        if params[:from].present? && params[:to].present?
            render json: current_brand.branches.includes(:sales).map { |branch| { name: branch.name, data: branch.sales.group_by_day(:sale_date, range: @from.to_s..@to.to_s).maximum(:net_total_sales) } }
        else    
            @date_to = Date.today.at_end_of_week(end_day = :sunday).strftime
            render json: current_brand.branches.includes(:sales).map { |branch| { name: branch.name, data: branch.sales.group_by_day_of_week(:sale_date, default_value: "missing", range: @from.strftime..@date_to, format: "%a" ).maximum(:net_total_sales) } }        
        end
    end

    def sales_per_branch
        branch = Branch.find(params[:br_id])
        date_from = params[:start]
        date_to = params[:end]
        render json: branch.sales.group_by_day_of_week(:sale_date, default_value: "No Data Yet", range: date_from..date_to, format: "%a").maximum(:net_total_sales)
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

    private
        def set_dates
            @from = @from = params[:from].present? ? Date.strptime(params[:from], '%m/%d/%Y') : Date.today.at_beginning_of_week(start_day = :sunday) 
            @to = params[:to].present? ? Date.strptime(params[:to], '%m/%d/%Y') : Date.today
        end

end