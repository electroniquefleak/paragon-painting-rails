class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: "Welcome! This is your dashboard, take a look around..."
    else 
      render :new
    end
  end

  private

  def user_params
    params.required(:user).permit(:name, :email, :password)
  end
end
