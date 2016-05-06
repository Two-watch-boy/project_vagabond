class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    print @user.photo
    if @user.photo == ""
      print "in if statement"
      @user.photo = "https://www.keypascoru.com/files/User_ring.png"
    end
    print @user.photo
    @user.save
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

  def update
    user_id = params[:id]
    user = User.find_by(id: user_id)
    if user.update(user_params)
      redirect_to user_path(user)
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to edit_user_path(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :password,:photo)
  end
end
