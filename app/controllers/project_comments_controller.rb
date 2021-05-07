class ProjectCommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

    def index
      @project= Project.find(params[:project_id])
    end
    def new
      @comment = ProjectComment.new
    end
  
    def create
      @comment = ProjectComment.new(project_comment_params)
      @comment.project_id = params[:project_id]
      if @comment.save
        flash[:notice] = "Your comment has been created."
        redirect_to project_project_comments_path(params[:project_id])
      else
        render :new
      end
    end
  
    def edit
    end

    def update
      if @comment.update(project_comment_params)
        flash[:notice]= "Comment updated"
        redirect_to dashboard_path
      else
        flash[:alert]= "Comment update was unsuccessful."
        render :edit
      end    
      #comment = ProjectComment.new(project_comment_params) 
    end

    def destroy
      @comment.delete
      reload
    end

    private

    def set_comment
      @comment = ProjectComment.find(params[:id])
    end

    def project_comment_params
      params.required(:project_comment).permit(
      :title,
      :body
    )
    end

end