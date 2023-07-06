class NewsController < ApplicationController
  def index
    @posts = if user_signed_in?
               Post.getUsersNews current_user.id
             else
               Post.all
             end
  end
end
