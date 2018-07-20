class Api::ReportsController < ApplicationController
    before_action :authenticate_user!

    def index
        @items = current_brand.items.for_inventory.includes(:purchase_items).all
        @user = branch_admin? ? current_user.branch : current_brand
        @date = params[:date].present? ? Date.strptime(params[:date], "%m/%d/%Y") : Date.today
    end

end