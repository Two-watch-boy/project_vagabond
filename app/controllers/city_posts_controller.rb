class CityPostsController < ApplicationController

  def new
    @post = Post.new
    @city = City.find_by(name: parse_city)
  end

  def create
    @post = Post.new(post_params)
    @city = City.find_by(name: parse_city)
    @post.city_id = City.find_by(name: parse_city).id
    @post.save
    if current_user.posts.push(@post)
      flash[:notice] = "#{@post.title} created"
      redirect_to city_post_path(@city.name.gsub(/" "/, "-"),@post)
    else
      @post.destroy
      flash[:error] = "Something went wrong, please post again."
      redirect_to new_post_path(@city.name.gsub(/" "/, "%20"))
    end
  end

  def update
    @post = Post.find(params[:post_id])
    if @post.update(post_params)
      flash[:success] = "Your post was successfully changed."
      redirect_to user_path(@post.user)
    else
      flash[:error] = "There was an error in your changes."
      redirect_to edit_user_post(@post)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @city = City.find_by(name: parse_city)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to root_path #change to city_show path eventually
  end

  private
  def post_params
    params.require(:post).permit(:title,:content,:photo)
  end

  def parse_city
    params[:city_name].gsub(/%20/, " ")
  end
end
