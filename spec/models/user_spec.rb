require 'rails_helper'
# require_relative '../config/environment'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  before :each do
    subject.save
  end

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post counter must be greater or equal to zero' do
    subject.post_counter = -1
    expect(subject).to_not be_valid
  end
end
