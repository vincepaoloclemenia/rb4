class Api::ItemsController < ApplicationController
    before_action :authenticate_user!
    
    def index        
		  @items = current_brand.items.ransack(params[:q])
    end
        
end