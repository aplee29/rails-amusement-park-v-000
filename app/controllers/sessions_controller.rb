class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find(params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back to the theme park!"
    else
      redirect_to signin_path
    end
  end

  def destroy
    reset_session    # Logs out user
    redirect_to root_path
  end
  
end