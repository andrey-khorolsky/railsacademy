class NewsController < ApplicationController
  # Get user's news or all posts
  def index
    @posts = if user_signed_in?
               Post.getUsersNews current_user.id
             else
               Post.all.order(created_at: :desc)
             end
  end
end
