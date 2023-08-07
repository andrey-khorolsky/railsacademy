class Follower < ApplicationRecord
  validates :author_id, uniqueness: { scope: :follower_id }
  validates :author_id, comparison: { other_than: :follower_id }

  # Check are user (follower) follow to another user (author)
  def self.areUserFollowTo(follower_id, author_id)
    where(['follower_id = ? and author_id = ?', follower_id, author_id]).count == 1
  end

  # Make follow user (follower) to another user (author)
  def self.follow(follower_id, author_id)
    Follower.new(author_id: author_id, follower_id: follower_id).save
  end

  # Make unfollow user (follower) to another user (author)
  def self.unfollow(follower_id, author_id)
    Follower.delete_by(author_id: author_id, follower_id: follower_id)
  end
end
