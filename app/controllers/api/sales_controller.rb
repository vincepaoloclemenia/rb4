class Api::SalesController < ApplicationController
    before_action :authenticate_user!
    
    def index   
        if branch_admin?
            @sales = if params[:date].present?
                        from = Date.strptime(params[:date].split(" - ")[0], "%m/%d/%Y")
                        to = Date.strptime(params[:date].split(" - ")[1], "%m/%d/%Y")
                        current_user.branch.sales.where(sale_date: from..to).paginate(page: params[:page], per_page: 10)
                    else
                        current_user.branch.sales.paginate(page: params[:page], per_page: 10)                        
                    end
        else
            if params[:branch_id].present?
                branch = Branch.find_by_id(params[:branch_id])
                if params[:date].present?
                    @from = Date.strptime(params[:date].split(" - ")[0], "%m/%d/%Y")
                    @to = Date.strptime(params[:date].split(" - ")[1], "%m/%d/%Y")
                    @date_range = @from..@to           
                    @sales = branch.sales.where(sale_date: @date_range).paginate(page: params[:page], per_page: 10)
                    @sales_with_data = branch.sales.get_sales_by_range(@date_range)
                    @sales_last_year = branch.sales.get_sales_by_range(@from.last_year..@to.last_year)
                    
                else
                    @sales = branch.sales.paginate(page: params[:page], per_page: 10)
                end
            end
            @branches = current_brand.branches.map { |branch| { value: branch.id, label: branch.name } }
        end
    end

    def get_sales_per_week
        @sales_this_week = if branch_admin?
                                current_user.branch.sales.get_all_by_week
                            else
                                if params[:branch_id].present?
                                    branch = Branch.find params[:branch_id]
                                    branch.sales.get_all_by_week if branch.present?
                                end
                            end

        @sales_last_week = if branch_admin?
                            Date.today.last_week.all_week.map do |date|
                                all_sales = current_user.branch.sales.where(sale_date: date)
                                { value: all_sales.map(&:net_total_sales).sum.round(2) }
                            end
                        else
                            if params[:branch_id].present?
                                branch = Branch.find params[:branch_id]
                                if branch
                                    Date.today.last_week.all_week.map do |date|
                                        all_sales = branch.sales.where(sale_date: date)
                                        { value: all_sales.map(&:net_total_sales).sum.round(2) }
                                    end
                                end
                            end
                        end
    end

    def get_sales_per_month
        @sales_this_year = if branch_admin?
                    current_user.branch.sales.get_all_by_month
                else
                end
        @sales_last_year = if branch_admin?
                            Date::MONTHNAMES.reject { |m| m.nil? || m.to_date > Date.today }.map do |month|
                                this_month_sales = current_user.branch.sales.where(sale_date: month.to_date.last_year.all_month)			
                                { value: this_month_sales.map(&:net_total_sales).sum.round(2) }		
                            end
                        else
                        end
    end

    def get_sales_averages
        if current_user.role.role_level.eql?('client') || current_user.role.role_level.eql?('brand')
            @last_week_ave_sales =  current_brand.last_week_sales                      
            @average_sales = current_brand.get_sales_average
        else
            @average_sales = current_user.branch.total_average_sales
            @last_week_ave_sales = current_user.branch.last_week_sales
        end     
    end

    def get_customer_count
        @customer_count =  current_user.role.role_level.eql?('branch') ? current_user.branch.customer_count_average : current_brand.customer_count_average
        @last_week_count = current_user.role.role_level.eql?('branch') ? current_user.branch.last_week_customer_count : current_brand.last_week_customer_count
        @percentage = @customer_count == 0 && @last_week_count == 0 ? 0 : (@last_week_count - @customer_count) * 100 / @customer_count
        render json: { customer_count: @customer_count, average_count: @last_week_count, percentage: @percentage }
    end

    def get_average_revenues
        @last_week_revenues = current_user.role.role_level.eql?('branch') ? current_user.branch.average_revenues("last_week") : current_brand.average_revenues("last_week")
        @average_revenues = current_user.role.role_level.eql?('branch') ? current_user.branch.average_revenues("daily") : current_brand.average_revenues("daily")
    end

end