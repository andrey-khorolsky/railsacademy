Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'news#index'

  resources :user

  resources :post

  get '/account', to: 'post#index'

  # Follow and unfollow to user
  get '/user/:id/follow', to: 'user#follow'
  get '/user/:id/unfollow', to: 'user#unfollow'

  # Like post and dislike
  get '/post/:id/like', to: 'post#like'
  get '/post/:id/dislike', to: 'post#dislike'

  # Write new post
  post '/post/:id/comment', to: 'post#addComment'
end
