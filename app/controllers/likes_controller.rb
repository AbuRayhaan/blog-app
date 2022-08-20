class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @likes.user_id = current_user.id
    respond_to do |format|
      if @like.save
        # flash[:success] = 'Like Created'
      end
      format.html { redirect_to_user_post_path(current_user, @post) }
  end
end