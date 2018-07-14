class Api::ItemAndCostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @items = current_brand.items.for_inventory.group_by { |i| i.category.parent.name }
        @branch = Branch.find 14
        @dr = "Jul 1, 2018 - Jul 31, 2018"
    end

    def this_month_for_brand_admin
        @purchase_items_within_month = current_brand.purchase_items.joins(:purchase).where( purchases: { purchase_date: Date.today.beginning_of_month..Date.today.end_of_month } ).group_by { |pi| pi.item.category.parent.name }
    end

    def this_week_for_brand_admin
        @range_lw = "#{Date.today.beginning_of_week.strftime("%b %d, %Y")} -#{Date.today.end_of_week.strftime("%b, %d, %Y")}"
        @range_tm = "#{Date.today.beginning_of_month.strftime("%b %d, %Y")} - #{Date.today.end_of_month.strftime("%b, %d, %Y")}" 
        @categories = current_brand.categories.main
        @branches = current_brand.branches.map { |x| { label: x.name, value: x.id } }.to_a
        @subcategories = current_brand.subcategories
        @purchase_items_last_week = current_brand.purchase_items.joins(:purchase).where( purchases: { purchase_date: Date.today.beginning_of_week..Date.today.end_of_week } ).group_by { |pi| pi.item.category.parent.name }
    end        

    def this_month_for_branch_admin
        @purchase_items_within_month = current_user.branch.purchase_items.joins(:purchase).where( purchases: { purchase_date: Date.today.beginning_of_month..Date.today.end_of_month } ).group_by { |pi| pi.item.category.parent.name }        
    end

    def this_week_for_branch_admin
        @range_lw = "#{Date.today.beginning_of_week.strftime("%b %d, %Y")} - #{Date.today.end_of_week.strftime("%b, %d, %Y")}"
        @range_tm = "#{Date.today.beginning_of_month.strftime("%b %d, %Y")} - #{Date.today.end_of_month.strftime("%b, %d, %Y")}" 
        @items = current_brand.items.for_inventory.group_by { |i| i.category.parent.name }    
        @branch = current_user.branch    
    end

    def filtered_records_for_brand
        @purchases = if params[:date].present?
            @from = Date.strptime(params[:date][0], "%m/%d/%Y")
            @to = Date.strptime(params[:date][1], "%m/%d/%Y") 
            if params[:branches].present?
                current_brand.purchase_items.includes(:purchase).where( purchases: { purchase_date: @from..@to, branch_id: params[:branches] } ).group_by { |pi| pi.item.category.parent.name }
            else
                current_brand.purchase_items.includes(:purchase).where( purchases: { purchase_date: @from..@to } ).group_by { |pi| pi.item.category.parent.name }
            end
        else
            if params[:branches].present? 
                current_brand.purchase_items.includes(:purchase).where( purchases: { branch_id: params[:branches] } ).group_by { |pi| pi.item.category.parent.name }                
            end
        end
    end

    def filtered_records_for_branch
        if params[:date].present?
            @from = Date.strptime(params[:date][0], "%m/%d/%Y")
            @to = Date.strptime(params[:date][1], "%m/%d/%Y") 
            @purchases = current_user.branch.purchase_items.includes(:purchase).where( purchases: { purchase_date: @from..@to } ).group_by { |pi| pi.item.category.parent.name }            
        end
    end

end