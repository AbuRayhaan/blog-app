require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
  end
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
    it 'assigns all users to @users' do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end
  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: @user.id }
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
    it 'assigns the requested user to @user' do
      get :show, params: { id: @user.id }
      expect(assigns(:user)).to eq(@user)
    end
  end
end
