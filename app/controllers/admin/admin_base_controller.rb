class Admin::AdminBaseController < ActionController::Base
    protect_from_forgery with: :exception
    layout 'admin_view'
    before_action :kick_unauthorized

    helper_method :admin_signed_in?, :current_admin

    def current_admin
        @current_admin = Admin.find(session[:admin_id])
    end

    private

        def kick_unauthorized
            if user_signed_in? 
                redirect_to root_path
            end
        end
        
        def admin_signed_in?
            session[:signed_in] && current_admin
        end

        def return_login
            unless admin_signed_in?
                redirect_to admin_login_path
            end
        end

        def return_dashboard
            if admin_signed_in?
                redirect_to admin_dashboard_path, alert: "You are already signed in"
            end
        end
end