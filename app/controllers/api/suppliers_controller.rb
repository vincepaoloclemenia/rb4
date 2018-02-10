class Api::SuppliersController < ApplicationController

    def create
    end

    def update
        @supplier = current_brand.suppliers.find(params[:id])
        @supplier.update(tin: "ABCDESample")
        render nothing: true
    end

end