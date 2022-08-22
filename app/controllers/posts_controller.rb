class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comment_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to user_posts_path(current_user)
      # flash[:success] = 'Post Created'
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
