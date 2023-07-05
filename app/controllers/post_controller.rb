class PostController < ApplicationController
  def index
    @post = Post.all
  end

  def create
    @post = Post.new(params.require(:post).permit(:text))
    @post.user_id = current_user.id
    @post.img = params[:post][:img]
    # binding.pry
    @post.save

    redirect_to '/post'
  end

  def show
    @post = Post.find(params['id'])
  end
end
