require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', bio: 'teacher in uganda')
  user.save

  subject do
    Post.new(title: 'My new post', text: 'Hello', author: user)
  end

  before { subject.save }

  it 'it should check if the title is available' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Post counter must be greater or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
  it 'loads only the most recent 5 comments' do
    expect(subject.recent_comments).to eq(subject.comments.last(5))
  end

  it 'should have 250 characters' do
    subject.title = 'm' * 300
    expect(subject).to_not be_valid
  end
end
