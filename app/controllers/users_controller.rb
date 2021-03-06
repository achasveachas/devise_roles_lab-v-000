class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin? && current_user != @user
      flash[:error] = "Access denied."
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.destroy
      redirect_to users_path
    else
      redirect_to users_path
    end
  end
end
