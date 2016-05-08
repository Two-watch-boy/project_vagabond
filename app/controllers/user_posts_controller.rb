class UserPostsController < ApplicationController

  def show
    # @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:post_id])
    @interaction = interact(1,@post.city)
  end

  def destroy
    post_id = params[:posts_id]
    post = Post.find_by_id(post_id)
    post.destroy
    redirect_to user_path(id: params[:user_id])
  end

end
