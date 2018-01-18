Rails.application.routes.draw do

  get 'toppages/index'

  devise_for :users
  
  resources :users, only: [:index, :show] do
    resources :posts
  end
  
  resources :posts, only: [:index, :show] do
    resources :likes, only: [:create, :destroy]
  end
  
  root to: 'toppages#index'
end
