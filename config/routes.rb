Rails.application.routes.draw do
  # devise
  devise_for :users

  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new]
  end

  resources :posts, only: [:new, :create, :destroy] do
    resources :comments
    resources :likes
  end
end
