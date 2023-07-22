class Post < ApplicationRecord
  has_one_attached :img
  mount_uploader :img, PostimgUploader
  validates :img, presence: true

  # Get news for user
  def self.getUsersNews(user_id)
    @authors = Follower.select(:author_id).where('follower_id = ?', user_id)
    Post.where('user_id IN (?)', @authors).order(created_at: :desc)
  end

  # Check are user liked post
  def hasLikeFrom(user_id)
    Like.arePostLikedBy id, user_id
  end

  # Find user's post
  def self.findPostsBy(user_id)
    where('user_id = ?', user_id)
  end

  # Find post's author name
  def getAuthorsName
    User.find(user_id)[:name]
  end

  # Find post's author avatar
  def getAuthorsAvatar
    User.find(user_id)[:img]
  end
end
