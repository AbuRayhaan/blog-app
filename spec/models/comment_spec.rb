require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'adds comments' do
    author = User.new(name: 'Tom', photo: 'pic.jpeg', bio: 'Bio for user', post_counter: 0)
    post = Post.new(title: 'New test post', text: 'Hello', author:, likes_counter: 0, comment_counter: 0)
    post.save!

    comment_creator = User.new(name: 'Jerry', photo: 'pic.jpeg', bio: 'Bio for user', post_counter: 0)
    comment_creator.save!

    post.comments.create!(text: 'Hello', author: comment_creator)
    post.comments.create!(text: 'second post', author: comment_creator)
    expect(post.comments.length).to eql(2)
  end

end
