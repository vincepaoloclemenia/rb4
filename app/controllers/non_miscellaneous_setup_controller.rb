class NonMiscellaneousSetupController < ApplicationController
    before_action :authenticate_user!
    before_action :set_misce, only: [:edit, :update, :destroy]

    def index
        @non_misces = current_client.non_misces
    end

    def new
        @non_misce = current_client.non_misces.new
    end

    def create
        @non_misce = current_client.non_misces.new(non_misce_params)
        respond_to do |format|
			if @non_misce.save
				format.json { head :no_content }
				format.js { flash[:notice] = "Non-miscellaneous category successfully created" }
			else
				format.json { render json: @non_misce.errors, status: :unprocessable_entity }
			end
		end
    end

    def edit
    end

    def update
        respond_to do |format|
			if @non_misce.update(non_misce_params)
				format.json { head :no_content }
				format.js { flash[:notice] = "Non-miscellaneous category successfully updated" }
			else
				format.json { render json: @non_misce.errors, status: :unprocessable_entity }
			end
		end
    end

    def destroy
        respond_to do |format|
			if @non_misce.destroy
				format.json { head :no_content }
				format.js { flash[:notice] = "Non-miscellanes has been deleted" }
			else
				format.json { render json: @non_misce.errors, status: :unprocessable_entity }
			end
		end
    end

    private

        def non_misce_params
            params.require(:non_misce).permit(:name, :description, :is_active)
        end
        
        def set_misce
            @non_misce = current_client.non_misces.find params[:id]
        end
    
end