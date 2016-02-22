class ItemCostAnalysisReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :access_control

  def index
    # raise
    @categories = Category.main
    a = Date.today - 1.month
    b = Date.today 
    # inventory = Inventory.where("entry_date <= ? AND branch_id = ?", (Date.today - 1.month), 2).last
    inventory = Inventory.where(entry_date: a.beginning_of_month..a, branch_id: 1).last
    end_inventory = Inventory.where(entry_date: b.beginning_of_month..b, branch_id: 1).last
    # @ending_inventory = InventoryItem.where(inventory_items).last
    # @ending_inventory = Inventory.where("entry_date <= ? AND branch_id = ?", Date.today, 2).last
    if inventory.nil?
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


