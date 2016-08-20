class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the theme park!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    @user.update(user_params)
    flash[:notice] = "User was successfully updated."
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :tickets, :height, :nausea, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end