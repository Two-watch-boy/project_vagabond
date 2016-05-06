class UserPostsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:post_id])
  end

end
