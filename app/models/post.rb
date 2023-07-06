class Post < ApplicationRecord
  has_one_attached :img
  mount_uploader :img, PostimgUploader

  def self.getUsersNews(user_id)
    @authors = Follower.select(:author_id).where('follower_id = ?', user_id)
    Post.where('user_id IN (?)', @authors).order(created_at: :desc)
  end

  def hasLikeFrom(user_id)
    Like.arePostLikedBy id, user_id
  end

  def self.findPostsBy(user_id)
    where('user_id = ?', user_id)
  end
end
