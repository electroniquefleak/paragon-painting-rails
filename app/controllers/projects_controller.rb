class ProjectsController < ApplicationController
  before_action :authenticate_admin!, except: :show

  def new
    @project = Project.new
  end

  def create
    @project = User.new(user_params)
      if @project.save
        session[:project_id] = @project.project_id
        flash[:notice] = "Your project has been created."
        redirect_to dashboard_path
      else 
        render :new
      end
    end
  end

  def edit
  end

  def destroy
  end

  def show
    #if the current_user is not the "owner" of the project OR an admin, then redirect
  end
end
