class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_comments_counter
  after_destroy :decrease_comment_counter

  def update_comments_counter
    post.increment!(:comment_counter)
  end

  def decrease_comment_counter
    post.decrement!(:comment_counter) unless post.comment_counter.zero?
  end
end
