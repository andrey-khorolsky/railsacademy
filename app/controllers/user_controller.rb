class UserController < ApplicationController
  before_action :authenticate_user!
  rescue_from Exception, with: :redirect_error

  # Show all users
  def index
    @user = User.all
    find_user
    @title = 'All users'
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
    FollowMailer.newFollower(current_user, User.find(params[:id])).deliver_now
    Notice.follow(current_user.id, params[:id])
    redirect_back fallback_location: root_path
  end

  # Unfollow current user on author
  def unfollow
    Follower.unfollow current_user.id, params['id']
    Notice.unfollow(current_user.id, params[:id])
    redirect_back fallback_location: root_path
  end

  # Show all followers
  def followers
    @user = User.where(id: Follower.select(:follower_id).where(author_id: params[:user_id]))
    find_user
    @title = User.find(params[:user_id]).name + ' followers'
    render 'index'
  end

  # Show all following users
  def following
    @user = User.where(id: Follower.select(:author_id).where(follower_id: params[:user_id]))
    find_user
    @title = User.find(params[:user_id]).name + ' following to'
    render 'index'
  end

  private

  # Get user's metrics - posts count, followers count and following count
  def getUsersMetrics
    [
      Post.where('user_id = ?', @user.id).count,
      Follower.where('author_id = ?', @user.id).count,
      Follower.where('follower_id = ?', @user.id).count
    ]
  end

  # Find users by search if it needed
  def find_user
    return unless params[:search]

    @user = @user.where('name like :param1 or realname like :param1', { param1: "%#{params[:search]}%" })
  end

  # Redirect to /user if error
  def redirect_error
    redirect_to :user_index
  end
end
