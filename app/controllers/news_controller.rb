class NewsController < ApplicationController
  # Get user's news or all posts
  def index

    # 10.times do
    #   FactoryBot.create(:user)
    # end
    # 10.times do
    #   FactoryBot.create(:like)
    #   FactoryBot.create(:comment)
    # end
    # sign_in FactoryBot.create(:user)
    @posts = if user_signed_in?
               Post.getUsersNews current_user.id
             else
               Post.all.order(created_at: :desc)
             end
  end
end
