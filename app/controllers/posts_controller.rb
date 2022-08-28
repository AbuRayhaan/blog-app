class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: %i[index show]
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = @user.posts.includes([:comments])
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

  def set_user
    @user = User.find(params[:user_id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
