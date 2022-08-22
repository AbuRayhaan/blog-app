class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.author = current_user
    respond_to do |format|
      if @like.save
        # @like.update_likes_counter
        # flash[:success] = 'Like Created'
      end
      format.html { redirect_to user_post_path(current_user, @post) }
    end
  end
end
