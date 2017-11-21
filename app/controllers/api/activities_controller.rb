class Api::ActivitiesController < ApplicationController
    before_action :authenticate_user!

    def index
        @activities = if current_user.role.role_level.eql?('branch')
            current_user.branch.brand.activities
        else
            current_brand.activities
        end
    end

end