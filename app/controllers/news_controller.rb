class NewsController < ApplicationController
  before_action :authenticate_user!, only: [:notifications]

  # Get user's news or all posts
  def index
    @posts = if user_signed_in?
               Post.getUsersNews current_user.id
             else
               Post.all.order(created_at: :desc)
             end
  end

  # Get user's notifications
  def notifications
    return unless user_signed_in?

    @notifications = Notice.where(author_id: current_user.id)
    DeleteOldNoticeJob.set(wait_until: Date.tomorrow.noon).perform_later
  end
end
