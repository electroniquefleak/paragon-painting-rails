class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "You are logged in!"
    else
      if user == nil
        flash[:alert] = "Invalid email.  Please try again."
      else
        flash[:alert] = "Invalid password."
      end
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Successful logout.  Please login to come back."
  end

  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect to '/login'
    end
  end
end
