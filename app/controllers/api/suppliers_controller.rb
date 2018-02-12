class Api::SuppliersController < ApplicationController
    before_action :authenticate_user!
	before_action :access_control

    def create
    end

    def update
        
        @supplier = current_brand.suppliers.find(params[:id])
        @supplier.update(supplier_params)
        render nothing: true
        
    end

    private

        def supplier_params
            params.require(:supplier).permit(:tin)
        end

end