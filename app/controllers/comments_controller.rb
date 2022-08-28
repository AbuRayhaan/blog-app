class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    respond_to do |format|
      if @comment.save
        format.js { render :index }
        flash[:success] = 'Comments Added!'
      else
        formt.html { redirect_to_user_post_path(current_user, @post) }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { render :index }
      format.html { redirect_to user_post_path(current_user, @comment.post) }
      flash[:success] = 'Comment deleted successfully'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
