class PostController < ApplicationController

    def index
        @post = Post.all
    end

    def create
        @post = Post.new(params.require(:post).permit(:text, :img))
        @post.author_id = current_user.id
        @post.save
    end

    def show
        @post = Post.find(params['id'])
    end
end
