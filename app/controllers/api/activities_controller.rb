class Api::ActivitiesController < ApplicationController
    before_action :authenticate_user!

    def index
        @activities = if current_user.role.role_level.eql?('branch')
            current_user.branch.brand.activities.paginate(page: params[:page], per_page: 7)
        else
            current_brand.activities.paginate(page: params[:page], per_page: 7)
        end
    end

end