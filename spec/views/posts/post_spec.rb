require 'rails_helper'

RSpec.describe Post, type: :view do
  before :each do
    @user = User.create(name: 'Tom', photo: 'avatal.jpg', bio: 'Teacher from Mexico.')
    @user.posts.create(title: 'Title', text: 'Body')
    visit user_post_path(@user, @user.posts.first)
  end

  context 'Post show page' do
    it 'Should display post\s title' do
      expect(page).to have_content('Title')
    end
    it 'should display posts comment counter' do
      expect(page).to have_content('Comments: 0')
    end
    it 'should display posts likes counter' do
      expect(page).to have_content('Likes: 0')
    end
    it 'Should display post\s text' do
      expect(page).to have_content('Body')
    end
  end

  context 'Post index page' do
    it 'Should display username' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Tom')
    end

    it 'should display user photo' do
      visit user_posts_path(@user.id)
      expect(page.html).to include('avatal')
    end

    it 'Should display number of posts each user has' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Number of posts: 1')
    end

    it 'Should display title of posts each user has' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Title')
    end

    it 'Should display body of posts each user has' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Body')
    end

    it 'Should allow user to add a post' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('New Post')
    end
  end
end
