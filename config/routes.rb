Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  resources :posts
  
  resources :users, only: [:index, :show] do
    resources :posts
  end
  
  resources :posts, only: [:index, :show] do
    resources :likes, only: [:create, :destroy]
  end
  
  root to: 'toppages#index'
end
