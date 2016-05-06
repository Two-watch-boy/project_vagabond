class UserPostsController < ApplicationController

  def show
    # @user = User.find(params[:user_id])
    @post = Post.find_by(id: params[:post_id])
  end

<<<<<<< HEAD:vagabond/app/controllers/user_posts_controller.rb
=======

>>>>>>> b09c2984a6d5cab509ef40c8829751480e165bb6:app/controllers/user_posts_controller.rb
  def destroy
    post_id = params[:posts_id]
    post = Post.find_by_id(post_id)
    post.destroy
    redirect_to user_path(id: params[:user_id])
  end

end
