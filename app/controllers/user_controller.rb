class UserController < ApplicationController
  before_action :authenticate_user!
  rescue_from Exception, with: :redirect_error

  # Show all users
  def index
    @user = User.all
  end

  # Show user's account
  def show
    @user = User.find(params['id'])
    @follower = Follower.areUserFollowTo current_user.id, @user.id if current_user.id != params[:id].to_i

    @posts = Post.findPostsBy(@user.id).order(created_at: :desc)
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

  # Redirect to /user if error
  def redirect_error
    redirect_to :user_index
  end
end
