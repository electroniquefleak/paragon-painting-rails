class DashboardsController < ApplicationController
    #before_action to check if the current_user is there (meaning they are logged in).
    #before_action to get the current_users info
    before_action :require_login

    def dashboard
        #@user = current_user
    end

  private

    def require_login
        unless current_user
        flash[:alert] = "You must be logged in to access this section."
        redirect_to login_path
        end
    end
end
