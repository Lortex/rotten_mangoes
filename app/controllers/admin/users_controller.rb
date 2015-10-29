class Admin::UsersController < AdminController
  def show
    @users = User.all
  end

  def index
    @users = User.page(params[:page]).per(2)
  end

  protected
  
  def user_params
    params.require(:user).permit(
      :email, :firstname, :lastname, :password, :password_confirmation
    )
  end
end
