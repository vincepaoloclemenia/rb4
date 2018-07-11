class Admin::SessionsController < Admin::AdminBaseController
    before_action :return_dashboard, only: [:new, :create]
    def new
    end
    
    def create
        if params[:signin].present?
            s = params[:signin]
            password = s[:password]
            email = s[:login]
            admin = Admin.find_by(username: s[:login]) || Admin.find_by(email: s[:login])
            pwv = PasswordVerifier.new(admin, password ) unless admin.nil?
            if admin && pwv.valid? && password
                session[:signed_in] = true
                session[:admin_username] = admin.username
                session[:admin_id] = admin.id
                redirect_to admin_dashboard_path, notice: "Admin successfully logged in"
            else
                flash.now[:alert] = "Invalid email or password"
                render action: "new"
            end
        else
            redirect_to '/admin/login', alert: "Invalid credentials"
        end
    end

    def destroy
        @_current_admin = session[:admin_id] = nil
        @_admin_username = session[:username] = nil
        session[:signed_in] = false
        redirect_to admin_login_path, notice: "You have successfully logged out"
    end

end