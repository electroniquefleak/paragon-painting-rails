class DashboardsController < ApplicationController
    #before_action to check if the current_user is there (meaning they are logged in).
    #before_action to get the current_users info
    before_action :require_login

    #dashboard view same as projects/tools indexes (for the specifiic employee)
    def dashboard
        if current_user.admin?
            @projects = Project.all
            @tools = Tool.all
        else
            @projects = current_user.projects
            @tools = current_user.tools
        end
    end

  private

    def require_login
        unless current_user
        flash[:alert] = "You must be logged in to access this section."
        redirect_to login_path
        end
    end
end
