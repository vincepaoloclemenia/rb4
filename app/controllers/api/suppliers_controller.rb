class Api::SuppliersController < ApplicationController
    before_action :authenticate_user!
    
    def index        
		@suppliers = if params[:search]
			current_brand.suppliers.search(params[:search])
		else
			@suppliers = current_client.suppliers.not_deleted
		end
    end
        
end