class PostController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.where user_id: current_user.id
  end

  def create
    @post = Post.new(params.require(:post).permit(:text))
    @post.user_id = current_user.id
    @post.img = params[:post][:img]
    @post.save

    redirect_to '/post'
  end

  def show
    @post = Post.find(params['id'])
  end

  def like
    Like.like params['id'], current_user.id
    redirect_back fallback_location: root_path
  end

  def dislike
    Like.dislike params['id'], current_user.id
    redirect_back fallback_location: root_path
  end

end
