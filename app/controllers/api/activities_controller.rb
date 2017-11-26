class Api::ActivitiesController < ApplicationController
    before_action :authenticate_user!

    def index
        @activities = if current_user.role.role_level.eql?('branch')
            branch_users = current_client.users.branch_users(current_user.branch)
            branch_users << current_client.id
            current_user.branch.brand.activities.where(user_id: branch_users, recordable: current_user.branch.filter_sales_purchase_items).paginate(page: params[:page], per_page: 7)
        else
            current_brand.activities.paginate(page: params[:page], per_page: 7)
        end
    end

end