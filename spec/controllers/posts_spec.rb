require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
    @post = Post.create(title: 'Title', text: 'Body', author_id: @user.id)
  end
  describe 'GET #index' do
    it 'renders the index template' do
      get :index, params: { user_id: @user.id }
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
    it 'assigns all posts to @posts' do
      get :index, params: { user_id: @user.id }
      expect(assigns(:posts)).to eq(@user.posts)
    end
  end
  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: @post.id, user_id: @user.id }
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
    it 'assigns the requested post to @post' do
      get :show, params: { id: @post.id, user_id: @user.id }
      expect(assigns(:post)).to eq(@user.posts.find(@post.id))
    end
  end
end