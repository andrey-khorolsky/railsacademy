Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'news#index'

  resources :user, only: [:index, :show]

  resources :post, only: [:create, :new, :show, :destroy]

  # Follow and unfollow to user
  get '/user/:id/follow', to: 'user#follow'
  get '/user/:id/unfollow', to: 'user#unfollow'

  # Like and dislike post
  get '/post/:id/like', to: 'post#like'
  get '/post/:id/dislike', to: 'post#dislike'

  # Write new comment
  post '/post/:id/comment', to: 'post#addComment'
end
