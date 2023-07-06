class NewsController < ApplicationController
  def index
    @authors = Follower.select(:author_id).where('follower_id = ?', current_user.id)
    @posts = Post.where('user_id IN (?)', @authors).order(created_at: :desc)
  end
end
