class ItemCostAnalysisReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :access_control

  def index
    selected_date = Date.strptime(params[:date_entry], "%m/%d/%Y")
    past_date = selected_date - 1.month
    @categories = Category.main
    inventory = Inventory.where(entry_date: past_date.beginning_of_month..past_date.end_of_month, branch_id: params[:branch_id]).last
    end_inventory = Inventory.where(entry_date: selected_date.beginning_of_month..selected_date, branch_id: params[:branch_id]).last
    if inventory.nil? && end_inventory.nil? 
      @inventory_items = []
      @ending_inventory_items = []
    elsif inventory.nil?
      @inventory_items = []
      @ending_inventory_items = InventoryItem.where(inventory_id: end_inventory.id)
    elsif end_inventory.blank?
      @ending_inventory_items = []
      @inventory_items = inventory.inventory_items.pluck(:item_id)
    else
      @inventory_items = inventory.inventory_items.pluck(:item_id)
      @ending_inventory_items = InventoryItem.where(inventory_id: end_inventory.id)
    end
  end

end


