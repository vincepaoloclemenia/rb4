class Api::UsersController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    before_action :authenticate_user!

    def delete_picture
		current_user.avatar = nil
		current_user.save
		render nothing: true, status: 200
    end
    
end