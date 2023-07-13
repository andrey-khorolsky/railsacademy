class UserController < ApplicationController
  before_action :authenticate_user!

  # Show all users
  def index
    @user = User.all
  end

  # Show user's account
  def show
    redirect_to '/account' if current_user.id == params[:id].to_i

    @user = User.find(params['id'])
    @follower = Follower.areUserFollowTo current_user.id, @user.id
    @posts = Post.findPostsBy @user.id
    @metrics = getUsersMetrics
  end

  # Show current user's account
  def account
    @posts = Post.findPostsBy current_user.id
    @user = current_user
    @metrics = getUsersMetrics
  end

  # Follow current user on author
  def follow
    Follower.follow current_user.id, params['id']
    redirect_back fallback_location: root_path
  end

  # Unfollow current user on author
  def unfollow
    Follower.unfollow current_user.id, params['id']
    redirect_back fallback_location: root_path
  end

  private
  def getUsersMetrics
    [
      Post.where('user_id = ?', @user.id).count,
      Follower.where('author_id = ?', @user.id).count,
      Follower.where('follower_id = ?', @user.id).count
    ]
  end
end
