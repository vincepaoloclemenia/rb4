class Api::ReportsController < ApplicationController
    before_action :authenticate_user!

    def index
        @items = current_brand.items.for_inventory.includes(:purchase_items).all
        @user = branch_admin? ? current_user.branch : current_brand
        @date = params[:date].present? ? Date.strptime(params[:date], "%m/%d/%Y") : Date.today
    end

    def get_invoices
        @suppliers = current_brand.suppliers
        @branches = current_branches
        @user = branch_admin? ? current_branch : current_brand
        q = params[:invoice]
        @purchases = if q.present? && ( q[:branch].present? || q[:supplier].present? )
            if q[:date_range].present?
                from = Date.strptime(q[:date_range].split(" - ")[0], "%m/%d/%Y")
                to = Date.strptime(q[:date_range].split(" - ")[1], "%m/%d/%Y")
                @user.purchases.includes(:branch, :supplier).search_purchases(q[:supplier], q[:branch], [], "").where( purchase_date: from..to ).paginate(page: params[:page], per_page: 15)
            else
                @user.purchases.includes(:branch, :supplier).search_purchases(q[:supplier], q[:branch], [], "").paginate(page: params[:page], per_page: 15)
            end
        else
            @user.purchases.includes(:branch, :supplier).where(purchase_date: Date.today.all_week).paginate(page: params[:page], per_page: 15)
        end
    end

end