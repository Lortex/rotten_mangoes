class Admin::UsersController < ApplicationController
  def show
    @users = User.all
  end

  def index
    @users = User.all
  end

  protected
  
  def user_params
    params.require(:user).permit(
      :email, :firstname, :lastname, :password, :password_confirmation
    )
  end
end
