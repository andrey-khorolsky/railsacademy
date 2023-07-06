Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'user#index'

  resources :user

  resources :post
  
  get '/user/:id/follow', to: 'user#follow'
  get '/user/:id/unfollow', to: 'user#unfollow'

end
