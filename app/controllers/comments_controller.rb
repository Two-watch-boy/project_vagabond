class CommentsController < ApplicationController
  #
  # before_filter :set_post, except: [:new, :create]
  # before_filter :set_user, except: [:new, :create]
  # before_filter :verifyUser, except: [:new, :create]

  def show
    @comment = Comment.find_by(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    if current_user
      @comment = Comment.new(comment_params)
      @post = Post.find(params[:post_id])
      puts("POST ID: " + @post.id.to_s)
      @comment.save
      if @post.comments.push(@comment)
        interact(2,@post.city)
        current_user.comments.push(@comment)
        flash[:notice] = "New comment created."
        redirect_to city_post_path(@post.city.name.gsub(/" "/, "-"),@post)
      else
        @comment.destroy
        flash[:error] = "Something went wrong, please comment again."
        redirect_to new_comment_post_path(@post)
      end
    else
      flash[:error] = "You must be logged in to create a post"
      redirect_to new_user_path
    end
  end

  def update
    @comment = Comment.find(params[:comment_id])
    if @comment.user == current_user
      @post = Post.find(params[:post_id])
      if @comment.update(comment_params)
        flash[:success] = "Your comment was successfully changed."
        redirect_to city_post_path(@post.city.name.gsub(/" "/, "-"),@post)
      else
        flash[:error] = "Error!"
        redirect_to edit_comment_path(@post)
      end
    else
      flash[:error] = "You cannot update other users comments"
      redirect_to "/"
    end
  end

  def edit
    @comment = Comment.find(params[:comment_id])
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    if @comment.user == current_user
      @post = Post.find(params[:post_id])
      @comment.destroy
      redirect_to city_post_path(@post.city.name.gsub(/" "/, "-"),@post)
    else
      flash[:error] = "You cannot delete another users comment"
      redirect_to "/"
    end
  end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
