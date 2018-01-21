Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  
  resources :posts
  
  resources :users, only: [:index, :show , :destroy] do
    resources :posts
  end
  
  resources :posts, only: [:index, :show] do
    resources :likes, only: [:create, :destroy]
  end
  
  root to: 'toppages#index'
end
