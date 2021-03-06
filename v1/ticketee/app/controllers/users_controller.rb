class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #Sign in user by putting ID into SESSION
      session[:user_id] = @user.id
      flash[:notice] = "You have signed up successfully."
      #Later, this could be a profile/edit user-info page
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User has been updated."
      redirect_to @user
    else
      flash[:alert] = "User has not been updated"
      render action: "edit"
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation)
    end
end
