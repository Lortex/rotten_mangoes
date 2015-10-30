class Admin::UsersController < AdminController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page]).per(5)
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
      redirect_to admin_user_path(@user), notice: "#{@user.full_name} was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @movie.destroy
      redirect_to admin_users_path, notice: "User was deleted successfully"
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(
      :email, :firstname, :lastname, :password, :password_confirmation,
      :admin
    )
  end
end
