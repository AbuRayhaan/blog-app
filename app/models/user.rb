class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  # method that returns the 3 most recent posts for a given user

  def recent_post
    posts.limit(3).order(created_at: :desc)
  end
end
