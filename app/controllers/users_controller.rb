class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      #create a session for the user
      redirect dashboard_path
    else 
      render :new
    end
  end

  private

  def user_params
    params.required(:user).permitted(:name, :email, :password)
  end
end
