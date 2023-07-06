class Follower < ApplicationRecord
  def self.areUserFollowTo(user_id, author_id)
    where(['follower_id = ? and author_id = ?', user_id, author_id]).count >= 1
  end

  def self.follow(user_id, author_id)
    return if areUserFollowTo user_id, author_id

    Follower.new(author_id: author_id, follower_id: user_id).save
  end

  def self.unfollow(user_id, author_id)
    return unless areUserFollowTo user_id, author_id

    Follower.delete_by(author_id: author_id, follower_id: user_id)
  end
end
