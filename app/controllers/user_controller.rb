class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def show
    if (current_user.id == params[:id].to_i)
      redirect_to '/account'
    end

    @user = User.find(params['id'])
    @follower = Follower.areUserFollowTo current_user.id, @user.id
    @posts = Post.findPostsBy @user.id
  end

  def follow
    Follower.follow current_user.id, params['id']
    redirect_to '/user/' + params['id']
  end

  def unfollow
    Follower.unfollow current_user.id, params['id']
    redirect_to '/user/' + params['id']
  end
end
