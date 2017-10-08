class Api::ItemsController < ApplicationController
    before_action :authenticate_user!
    
    def index        
		@items = if params[:search]
			current_brand.items.search(params[:search]).paginate(page: params[:page], per_page: per_page)
		  else
			current_brand.items.paginate(page: params[:page], per_page: per_page)
		end
    end
        
end