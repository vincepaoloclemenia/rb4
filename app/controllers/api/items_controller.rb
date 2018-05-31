class Api::ItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :access_control

    def index
        @brand_items = current_brand.items.select(:name, :id)
        @items = if params[:item].present?
            current_brand.items.where(id: params[:item]).paginate(page: params[:page], per_page: 20)
        else
            current_brand.items.paginate(page: params[:page], per_page: 20)
        end
    end

end