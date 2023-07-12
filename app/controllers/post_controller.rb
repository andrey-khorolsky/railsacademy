class PostController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::InvalidForeignKey, with: :redirect_error

  # Create new post
  def create
    Post.new(text: params[:post][:text], img: params[:post][:img], user_id: current_user.id).save
    redirect_to :post_index
  end

  # Show selected post
  def show
    @post = Post.find(params['id'])
  end

  # Like post by current user
  def like
    Like.like params['id'], current_user.id
    redirect_back fallback_location: root_path
  end

  # Dislike post by current user
  def dislike
    Like.dislike params['id'], current_user.id
    redirect_back fallback_location: root_path
  end

  # Create comment to post by current user
  def addComment
    Comment.new(text: params[:comment][:text], post_id: params[:id], user_id: current_user.id).save
    redirect_back fallback_location: root_path
  end

  private

  # Redirect to /post if error
  def redirect_error
    redirect_back fallback_location: root_path
  end
end
