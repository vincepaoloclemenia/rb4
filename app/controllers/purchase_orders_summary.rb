class PurchaseOrdersSummary < ApplicationController
    before_action :authenticate_user!
    before_action :access_control

    def index
    end
    
end