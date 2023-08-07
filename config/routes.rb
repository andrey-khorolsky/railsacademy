Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Defines the root path route ("/")
  root to: 'news#index'

  resources :user, only: [:index]

  resources :user, only: [:show] do
    get '/followers', to: 'user#followers'
    get '/following', to: 'user#following'
  end

  resources :post, only: %i[create new show edit update destroy]

  # Follow and unfollow to user
  get '/user/:id/follow', to: 'user#follow'
  get '/user/:id/unfollow', to: 'user#unfollow'

  # Like and dislike post
  get '/post/:id/like', to: 'post#like'
  get '/post/:id/dislike', to: 'post#dislike'

  # Write new comment
  post '/post/:id/comment', to: 'post#addComment'

  # Notifications
  get '/notifications', to: 'news#notifications'
end
