class Admin::ClientsController < Admin::AdminBaseController
    before_action :return_login
    before_action :set_client, only: [:show, :edit, :update]
    
    def index
        @subscribers = Client.subscribers.includes(:brands, :subscriptions)
        @unsubscribed_clients = Client.free_trials.includes(:brands, :subscriptions)
    end

    def show
        @subscription = @client.subscriptions.new
        @plan = Plan.find 2
    end

    def subscribe_branches
        client = Client.friendly.find params[:client]
        redirect_to admin_client_path(client.slug), notice: "#{params[:branches_subscriptions]}"
    end


    private
        def set_client
            @client = Client.friendly.find(params[:id])
        end
end
