class PostController < ApplicationController
  before_action :authenticate_user!
  # rescue_from Exception, with: :redirect_error

  # Create new post
  def create
    Post.new(text: params[:post][:text], img: params[:post][:img], user_id: current_user.id).save
    redirect_to user_path(current_user)
  end

  # Show selected post
  def show
    @post = Post.find(params['id'])
  end

  # Delete the post
  def destroy
    Like.delete_by(post_id: params[:id])
    Comment.delete_by(post_id: params[:id])
    Post.delete(params[:id])
  end

  # Find post for edit and render page
  def edit
    @post = Post.find(params[:id])
  end

  # Update post (method patch)
  def update
    @post = Post.find(params[:id])
    @post.text = params[:post][:text]
    @post.img = params[:post][:img]
    @post.save
    redirect_to post_path(@post)
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

  # Redirect to news if error
  def redirect_error
    redirect_back fallback_location: root_path
  end
end
