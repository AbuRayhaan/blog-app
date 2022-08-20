class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        formt.html { redirect_to_user_post_path(current_user, @post) }
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end