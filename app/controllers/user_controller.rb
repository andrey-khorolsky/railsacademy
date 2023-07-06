class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.all
  end

  def create
    @user = User.new(params.required(:user).permit(:name, :email, :password))
    @user.save

    redirect_to '/user'
  end

  def show
    @user = User.find(params['id'])
    @follower = Follower.where(['author_id = ? and follower_id = ?', @user.id, current_user.id]).count == 1
    @posts = Post.findPostsBy @user.id
  end

  def follow
    Follower.new(author_id: params['id'], follower_id: current_user.id).save

    redirect_to '/user/' + params['id']
  end

  def unfollow
    Follower.delete_by(author_id: params['id'], follower_id: current_user.id)
    redirect_to '/user/' + params['id']
  end
end
