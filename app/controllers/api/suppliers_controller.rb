class Api::SuppliersController < ApplicationController

    def create
    end

    def update
        @supplier = current_brand.suppliers.find(params[:id])
        @emails = params[:emails]
        @supplier.update(emails: @emails.split(","))
        render nothing: true
    end

end