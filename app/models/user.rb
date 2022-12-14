class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  # method that returns the 3 most recent posts for a given user

  def recent_post
    posts.limit(3).order(created_at: :desc)
  end
end
