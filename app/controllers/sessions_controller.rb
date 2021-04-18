class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.user_id
      redirect dashboard_path, notice: "You are logged in!"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect login_path, notice: "Successful logout.  Please login to come back."
  end
end
