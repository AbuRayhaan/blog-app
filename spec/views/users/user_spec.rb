require 'rails_helper'

RSpec.describe User, type: :view do
  before :each do
    @user1 = User.create(name: 'Tom', photo: 'avatal.jpg', bio: 'Teacher from Mexico.')
    @user2 = User.create(name: 'Will', photo: 'avatal.jpg', bio: 'Teacher from Mexico.')
    @user1.posts.create(title: 'User1 Title', text: 'Body1')
    @user2.posts.create(title: 'User2 Title', text: 'Body2')
  end
  context 'User index page' do
    it 'Should display username' do
      visit root_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Will')
    end

    it 'should display user photo' do
      visit root_path
      expect(page.html).to include('avatal')
      expect(page.html).to include('avatal')
    end

    it 'Should display number of posts each user has' do
      visit root_path
      expect(page).to have_content('Number of posts: 1')
    end
  end
  context 'User show page' do
    it 'Should display username' do
      visit user_path(@user1.id)
      expect(page).to have_content('Tom')
    end
    it 'Should display user photo' do
      visit user_path(@user1.id)
      expect(page.html).to include('avatal')
    end
    it 'Should display user bio' do
      visit user_path(@user1.id)
      expect(page).to have_content('Teacher from Mexico.')
    end
    it 'Should display number of posts each user has' do
      visit user_path(@user1.id)
      expect(page).to have_content('Number of posts: 1')
    end
  end
  it 'Should display 3 last posts of user' do
    i = 0
    3.times do
      @user1.posts.create(title: "Title#{i}", text: 'Body')
      i += 1
    end
    visit user_path(@user1.id)
    expect(page).to have_content('Title0')
    expect(page).to have_content('Title1')
    expect(page).to have_content('Title2')
  end
  it 'Should display see all posts button' do
    visit user_path(@user1.id)
    expect(page).to have_content('See all the post')
  end
  it 'Should display all user post' do
    visit user_path(@user1.id)
    click_link 'See all the post'
    expect(current_path).to eq(user_posts_path(@user1.id))
  end
  context 'User post index page' do
    it 'Should display user photo' do
      visit user_posts_path(@user1.id)
      expect(page.html).to include('avatal')
    end
    it 'Should display user name' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Tom')
    end
    it 'Should display user posts count ' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Number of posts: 1')
    end
    it 'Should display post title' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('User1 Title')
    end
  end
  context 'User post show page' do
    it 'Should display post text' do
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Body1')
    end
    it 'Should display comments counter' do
      visit user_post_path(@user1.id, @user1.posts.first.id)
      expect(page).to have_content('0 Comment')
    end
    it 'Should display first comment' do
      @user1.comments.create(post_id: @user1.posts.first.id, text: 'Comment Testing')
      visit user_posts_path(@user1.id)
      expect(page).to have_content('Comment Testing')
    end
    it 'Should redirect to post page' do
      visit user_posts_path(@user1.id)
      click_link 'User1 Title'
      expect(current_path).to eq(user_post_path(@user1.id, @user1.posts.first.id))
    end
  end
end
