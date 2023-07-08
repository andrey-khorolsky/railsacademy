class Follower < ApplicationRecord
  validates :author_id, uniqueness: { scope: :follower_id }
  validates :author_id, comparison: { other_than: :follower_id}

  def self.areUserFollowTo(follower_id, author_id)
    where(['follower_id = ? and author_id = ?', follower_id, author_id]).count == 1
  end

  def self.follow(follower_id, author_id)
    Follower.new(author_id: author_id, follower_id: follower_id).save
  end

  def self.unfollow(follower_id, author_id)
    Follower.delete_by(author_id: author_id, follower_id: follower_id)
  end
end
