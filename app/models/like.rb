class Like < ApplicationRecord
  validates :post_id, uniqueness: { scope: :user_id }

  # Find likes count on post
  def self.findLikes(post_id)
    where(post_id: post_id).count
  end

  # Check are post liked by user
  def self.arePostLikedBy(post_id, user_id)
    where(post_id: post_id, user_id: user_id).count == 1
  end

  # Like post by user
  def self.like(post_id, user_id)
    Like.new(post_id: post_id, user_id: user_id).save
  end

  # Dislike (delete like) post by user
  def self.dislike(post_id, user_id)
    Like.delete_by(post_id: post_id, user_id: user_id)
  end
end
