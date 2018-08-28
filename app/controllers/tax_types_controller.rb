class TaxTypesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_tax_type, only: [:edit, :update, :destroy]
    
    def index
        @tax_types = current_brand.tax_types
        @empty_warning = current_brand.tax_types.empty? ? "block" : "none"
    end

    def new
        @tax_type = current_brand.tax_types.new
    end

    def create
        @tax_type = current_brand.tax_types.new(tax_type_params)
        respond_to do |format|
            if @tax_type.save
                @tax_types = current_brand.tax_types
				format.json { head :no_content }
				format.js { flash[:notice] = "Tax type successfully created" }
			else
				format.json { render json: @tax_type.errors, status: :unprocessable_entity }
			end
		end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @tax_type.update(tax_type_params)
                @tax_types = current_brand.tax_types
				format.json { head :no_content }
				format.js { flash[:notice] = "Tax type successfully saved" }
			else
				format.json { render json: @tax_type.errors, status: :unprocessable_entity }
			end
		end
    end

    def destroy
        respond_to do |format|
			if @tax_type.destroy
				format.json { head :no_content }
				format.js { flash[:notice] = "Tax type has been deleted" }
			else
				format.json { render json: @tax_type.errors, status: :unprocessable_entity }
			end
		end
    end
    
    private

        def tax_type_params
            params.require(:tax_type).permit(:brand_id, :name, :description, :percentage)
        end

        def find_tax_type
            @tax_type = current_brand.tax_types.find params[:id]
        end
end