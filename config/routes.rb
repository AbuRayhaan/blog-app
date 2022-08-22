Rails.application.routes.draw do
  get 'likes/create'
  get 'comments/new'
  get 'comments/create'
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts, only: [:new, :create] do
    resources :comments
    resources :likes
  end
end
