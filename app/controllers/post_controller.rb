class PostController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.findPostsBy current_user.id
  end

  def create
    Post.new(text: params[:post][:text], img: params[:post][:img], user_id: current_user.id).save
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

  def addComment
    Comment.new(text: params[:comment][:text], post_id: params['id'], user_id: current_user.id).save
    redirect_back fallback_location: root_path
  end
end
