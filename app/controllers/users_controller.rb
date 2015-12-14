class UsersController < ApplicationController
  before_action :require_login, only: [:index]

  def new
    @user = User.new
  end

  def index
      @users = User.all.shuffle
  end

  def create
    @user = User.new(user_params)
    if (@user.save)
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render "new"
    end
  end

  def profile
    @user = current_user
  end

  def update

    user = current_user
    user.name = params[:user][:name]
    user.email = params[:user][:email]
    user.image_url = params[:user][:image_url]

    user.save!
    redirect_to users_profile_path

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
