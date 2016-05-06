class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.save
    if current_user.posts.push(@post)
      flash[:notice] = "#{@post.title} created"
      redirect_to user_post_path(current_user.first_name,@post)
    else
      @post.destroy
      flash[:error] = "Something went wrong, please post again."
      redirect_to new_post_path
    end
  end

  def update
    @post = Post.find(params[:post_id])
    if @post.update(posts_params)
      flash[:success] = "Your post was successfully changed."
      redirect_to user_path(@post.user)
    else
      flash[:error] = "There was an error in your changes."
      redirect_to edit_user_post(@post)
    end
  end

  def edit
    @post = Post.find(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title,:content,:photo)
  end
end
