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

  private
  def post_params
    params.require(:post).permit(:title,:content,:photo)
  end
end
