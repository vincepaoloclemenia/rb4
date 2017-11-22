class Api::UsersController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    before_action :authenticate_user!
    before_action :set_branch, only: :users_per_branch

    def index
      @users = current_client.users
    end

    def users_per_branch
      @users = current_client.users.where()
    end

    def delete_picture
      current_user.avatar = nil
      current_user.save
      render nothing: true, status: 200
    end

    private

      def set_branch
        @branch = Branch.find_by_id(params[:branch_id])
      end
    
end