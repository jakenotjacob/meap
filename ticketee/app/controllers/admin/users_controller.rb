class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:email)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been created."
      redirect_to admin_users_path
    else
      flash.now[:alert] = "User has not been created."
      render action: "new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email,
                                  :password, :password_confirmation,
                                  :admin)
    end
   
    def set_user
      @user = User.find(params[:id])
    end

end
