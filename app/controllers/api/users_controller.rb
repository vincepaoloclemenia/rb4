class Api::UsersController < ApplicationController
    protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
    before_action :authenticate_user!
    before_action :set_branch, only: :users_per_branch
    before_action :set_brand, only: :users_per_brand

    def index
      @company_admins = current_client.users.users_by_roles('client')
      @branch_admins = current_client.users.users_by_roles('branch')
      @brand_admins = current_client.users.users_by_roles('brand')
    end

    def users_per_branch
      @users = current_client.users.branch_users(@branch)
    end

    def users_per_brand
      @users = current_client.users.brand_users(@brand)
    end

    def delete_picture
      current_user.avatar = nil
      current_user.save
      render nothing: true, status: 200
    end

    private

      def set_branch
        @branch =  Branch.find_by_id(params[:branch_id])
      end

      def set_brand
        @brand = Brand.find_by_id(params[:brand_id])
      end
    
end