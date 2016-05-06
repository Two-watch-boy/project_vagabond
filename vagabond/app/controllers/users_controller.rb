class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  def edit
      user_id = params[:id]
      @user = User.find_by(id: user_id)
      render :edit
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :password,:photo)
  end
end
