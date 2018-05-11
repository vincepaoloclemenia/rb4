class Api::ItemAndCostsController < ApplicationController
    before_action :authenticate_user!, :get_user

    def index
        @categories = current_brand.categories.main
        @subcategories = current_brand.subcategories
        @purchase_items_within_month = @user.purchase_items.joins(:purchase).where( purchases: { purchase_date: Date.today.beginning_of_month..Date.today.end_of_month } ).group_by { |pi| pi.item.category.parent.name }
        @purchase_items_last_week = @user.purchase_items.joins(:purchase).where( purchases: { purchase_date: Date.today.beginning_of_week..Date.today.end_of_week } ).group_by { |pi| pi.item.category.parent.name }
        @range_lw = "#{Date.today.beginning_of_week.strftime("%b %d, %Y")} -#{Date.today.end_of_week.strftime("%b, %d, %Y")}"
        @range_tm = "#{Date.today.beginning_of_month.strftime("%b %d, %Y")} - #{Date.today.end_of_month.strftime("%b, %d, %Y")}" 
    end

    def filtered_records
        if params[:date].present?
            @from = Date.strptime(params[:date][0], "%m/%d/%Y")
            @to = Date.strptime(params[:date][1], "%m/%d/%Y") 
            @purchases = @user.purchase_items.joins(:purchase).where( purchases: { purchase_date: @from..@to } ).group_by { |pi| pi.item.category.parent.name }
        end
    end

    private

        def get_user
            @user = current_user.role.role_level == 'branch' ? current_user.branch : current_brand
        end

end