class ItemCostAnalysisReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :access_control

  def index
    if params[:q].present?
      range = params[:q][:date_range].split(" - ")
      from = Date.strptime(range[0], "%m/%d/%Y")
      to = Date.strptime(range[1], "%m/%d/%Y") 
      @branch = branch_admin? ? current_user.branch : Branch.find(params[:q][:branch_id])
      @date = "#{from.strftime('%b %d, %Y')} - #{to.strftime('%b %d, %Y')}"
      @items = current_brand.items.for_inventory.group_by { |i| i.category.parent.name }
      @choice = params[:q][:chosen]
      respond_to do |format|
        format.js
      end
    else
      @date = "#{Date.today.beginning_of_week.strftime('%b %d, %Y')} - #{Date.today.end_of_week.strftime('%b %d, %Y')}"
      @branch = current_user.branch
      @choice = "week"
      @items = current_brand.items.for_inventory.group_by { |i| i.category.parent.name }
    end
=begin
      if params[:date_entry].nil?
        selected_date = Date.today
      else
        selected_date = Date.strptime(params[:date_entry], "%m/%d/%Y")
      end   
      past_date = selected_date - 12.month
      @categories = Category.main
      inventory = Inventory.where(entry_date: past_date.beginning_of_month..past_date.end_of_month, branch_id: params[:branch_id]).last
      end_inventory = Inventory.where(entry_date: selected_date.beginning_of_month..selected_date, branch_id: params[:branch_id]).last
      # @inventory_items = inventory.inventory_items.pluck(:item_id)


      if inventory.nil? && end_inventory.nil? 
        @inventory_items = []
        @ending_inventory_items = []
      elsif inventory.nil?
        @inventory_items = []
        @ending_inventory_items = InventoryItem.where(inventory_id: end_inventory.id)
      elsif end_inventory.nil?
        @ending_inventory_items = []
        @inventory_items = inventory.inventory_items.pluck(:item_id)
      else
        @inventory_items = inventory.inventory_items.pluck(:item_id)
        @ending_inventory_items = InventoryItem.where(inventory_id: end_inventory.id)
      end
=end
  end

end


