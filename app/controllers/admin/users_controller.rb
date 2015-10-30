class Admin::UsersController < AdminController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page]).per(2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "#{@user.full_name} was created successfully!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_users_path(@user)
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(
      :email, :firstname, :lastname, :password, :password_confirmation
    )
  end
end
