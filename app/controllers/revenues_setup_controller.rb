class RevenuesSetupController < ApplicationController
    before_action :authenticate_user!
    def index
        @revenues = current_client.revenues
    end
    
    def new
        @revenue = current_client.revenues.new
    end
    
    def create
        @revenue = current_brand.revenues.new(revenue_params)
        respond_to do |format|
			if @revenue.save
				format.json { head :no_content }
				format.js { flash[:notice] = "Revenue category successfully created" }
			else
				format.json { render json: @revenue.errors, status: :unprocessable_entity }
			end
		end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

        def revenue_params
            params.require(:revenu).permit(:name, :is_active, :description)
        end

end