class Api::ItemAndCostsController < ApplicationController

    def index
        @categories = current_brand.categories.main
        @subcategories = current_brand.subcategories
        @purchase_items_within_month = current_brand.purchase_items.joins(:purchase).where( purchases: { purchase_date: Date.today.beginning_of_month..Date.today.end_of_month } ).group_by { |pi| pi.item.category.parent.name }
        @purchase_items_last_week = current_brand.purchase_items.joins(:purchase).where( purchases: { purchase_date: Date.today.beginning_of_week..Date.today.end_of_week } ).group_by { |pi| pi.item.category.parent.name }
        @range_lw = "#{Date.today.beginning_of_week.strftime("%b %d, %Y")} -#{Date.today.end_of_week.strftime("%b, %d, %Y")}"
        @range_tm = "#{Date.today.beginning_of_month.strftime("%b %d, %Y")} - #{Date.today.end_of_month.strftime("%b, %d, %Y")}" 
    end

    def filtered_records
        if params[:date].present?
            @from = Date.strptime(params[:date][0], "%m/%d/%Y")
            @to = Date.strptime(params[:date][1], "%m/%d/%Y") 
            @purchases = current_brand.purchase_items.joins(:purchase).where( purchases: { purchase_date: @from..@to } ).group_by { |pi| pi.item.category.parent.name }
        end
    end

end