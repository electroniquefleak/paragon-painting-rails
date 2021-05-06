class ProjectsController < ApplicationController
  before_action :authenticate_admin!, except: :show
  before_action :get_project, except: [:new, :create]

  def new
    @project = Project.new
    3.times {@project.tools.build}
    @project.project_comments.build
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "Your project has been created."
      redirect_to dashboard_path
    else 
      render :new
    end
  end

  def edit
  end

  def destroy
    @project.destroy
    redirect_to dashboard_path, notice: "Successful Project Deletion."
  end

  def show
  end

  private

  def get_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.required(:project).permit(
      :name,
      :location,
      :start_date,
      :end_date,
      :description,
      :revenue_estimate, 
      :cost_estimate,
      user_ids: [],
      tools_attributes: [:item_name, :description, :quantity],
      project_comments_attributes: [:title, :body]
    )
  end
end
