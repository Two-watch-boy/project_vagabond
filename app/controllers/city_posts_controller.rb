class CityPostsController < ApplicationController
  before_filter :set_post, except: [:new, :create]
  before_filter :set_user, except: [:new, :create]
  before_filter :verifyUser, except: [:new, :create]

  def new
    @post = Post.new
    @city = City.find_by(name: parse_city)
  end

  def create
    if current_user
      @post = Post.new(post_params)
      @city = City.find_by(name: parse_city)
      @post.city_id = City.find_by(name: parse_city).id
      @post.save
      if current_user.posts.push(@post)
        interact(3,@city)
        flash[:notice] = "#{@post.title} created"
        redirect_to city_post_path(@city.name.gsub(/" "/, "-"),@post)
      else
        @post.destroy
        flash[:error] = "Something went wrong, please post again."
        redirect_to new_post_path(@city.name.gsub(/" "/, "%20"))
      end
    else
      flash[:error] = "You must be logged in to create a post"
      redirect_to new_user_path
    end
  end

  def update
    # @post = Post.find(params[:post_id])
    if @post.update(post_params)
      flash[:success] = "Your post was successfully changed."
      redirect_to user_path(@post.user)
    else
      flash[:error] = "There was an error in your changes."
      redirect_to edit_user_post(@post)
    end
  end

  def edit
    # @post = Post.find(params[:post_id])
    @city = City.find_by(name: parse_city)
  end

  def destroy
    # @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to root_path #change to city_show path eventually
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_user
    @user = @post.user
  end

  def post_params
    params.require(:post).permit(:title,:content,:photo)
  end

  def parse_city
    params[:city_name].gsub(/%20/, " ")
  end
end
