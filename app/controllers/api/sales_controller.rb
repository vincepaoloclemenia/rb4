class Api::SalesController < ApplicationController
    before_action :authenticate_user!
    
    def index        
		  @sales = current_brand.sales.paginate(page: params[:page], per_page: 5)
    end
        
end