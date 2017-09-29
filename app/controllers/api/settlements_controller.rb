class Api::SettlementsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_settlement, only: [:update, :destroy]
    before_action :access_control
    
    def index        
		@settlements = current_client.settlements.paginate(page: params[:page], per_page: 10)
    end
    
    def create
		settlement = current_client.settlements.create(settlement_params)
    end
    
    def update
        @settlement.update(settlement_params)
    end

    def destroy
        @settlement.destroy
    end

    private

        def set_settlement
            @setllement = current_client.settlements.find_by_id(params[:settlement_id])
        end

        def settlement_params
            params.require(:settlement).permit(:name, :is_complimentary, :client_id, :description, :is_active)
        end
        
end