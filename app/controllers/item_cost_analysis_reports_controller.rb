class ItemCostAnalysisReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :access_control

  def index
    a = Date.strptime(params[:date_entry], "%m/%d/%Y")
    a = a - 1.month
    end
    @categories = Category.main
    # a = Date.today - 1.month
    b = Date.today 
    # inventory = Inventory.where("entry_date <= ? AND br∂anch_id = ?", (Date.today - 1.month), 2).last
    inventory = Inventory.where(entry_date: a.beginning_of_month..a.end_of_month, branch_id: params[:branch_id]).last
    end_inventory = Inventory.where(entry_date: b.beginning_of_month..b, branch_id: params[:branch_id]).last
    # @ending_inventory = InventoryItem.where(inventory_items).last
    # @ending_inventory = Inventory.where("entry_date <= ? AND branch_id = ?", Date.today, 2).last
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
      # @inventory_items = InventoryItem.where(inventory_id: inventory.id).pluck(:item_id)
      @inventory_items = inventory.inventory_items.pluck(:item_id)
      @ending_inventory_items = InventoryItem.where(inventory_id: end_inventory.id)
      # @ending_inventory_items = InventoryItem.where(inventory_id: ending_inventory.id)
    end
  end

end


