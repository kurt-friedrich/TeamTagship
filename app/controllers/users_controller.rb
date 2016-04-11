class UsersController < ApplicationController
  before_action :disallow_user, :only => [:new, :create]
  before_action :require_user, :only => [:follow, :unfollow, :index]

  def index
    @user = User.find(params[:user_id])
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @ships = @user.ships.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow!(@user)
    redirect_to :back || :root
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    redirect_to :back || :root
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
