class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @user = User.new(user_params)
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
end
