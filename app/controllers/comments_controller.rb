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
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    puts("POST ID: " + @post.id.to_s)
    @comment.save
    if @post.comments.push(@comment)
      flash[:notice] = "New comment created."
      redirect_to city_post_path(@post.city.name.gsub(/" "/, "-"),@post)
    else
      @comment.destroy
      flash[:error] = "Something went wrong, please comment again."
      redirect_to new_comment_post_path(@post)
    end
  end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

end

  # def update
  #   # @post = Post.find(params[:post_id])
  #   if @post.update(post_params)
  #     flash[:success] = "Your post was successfully changed."
  #     redirect_to user_path(@post.user)
  #   else
  #     flash[:error] = "There was an error in your changes."
  #     redirect_to edit_user_post(@post)
  #   end
  # end
  #
  # def edit
  #   # @post = Post.find(params[:post_id])
  #   @city = City.find_by(name: parse_city)
  # end
  #
  # def destroy
  #   # @post = Post.find(params[:post_id])
  #   @post.destroy
  #   redirect_to root_path #change to city_show path eventually
  # end
