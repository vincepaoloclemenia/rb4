class ItemCostAnalysisReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :access_control

  def index
    @categories = Category.main
    inventory = Inventory.where("entry_date <= ? ", Date.today).last
    @inventory_items = InventoryItem.where(inventory_id: inventory.id).pluck(:item_id)
    # @purchases = get_purchases
  end

  def get_categories
    categories = Category.main
  end

  
end
