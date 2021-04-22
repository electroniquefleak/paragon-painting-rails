class ProjectsController < ApplicationController
  before_action :authenticate_admin!, except: :show

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
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

  private

  def project_params
    params.required(:project).permit(:location, :start_date, :end_date, :description, :revenue_estimate, :cost_estimate)
  end
end
