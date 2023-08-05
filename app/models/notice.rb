class Notice < ApplicationRecord
  belongs_to :notice_type

  def self.like(user_id, post_id)
    Notice.new(author_id: User.find(Post.find(post_id).user_id).id, users_id: user_id, posts_id: post_id,
               notice_type_id: 2).save
  end

  def self.dislike(user_id, post_id)
    Notice.delete_by(author_id: User.find(Post.find(post_id).user_id).id, users_id: user_id, posts_id: post_id,
                     notice_type_id: 2)
  end

  def self.comment(user_id, post_id)
    Notice.new(author_id: User.find(Post.find(post_id).user_id).id, users_id: user_id, posts_id: post_id,
               notice_type_id: 3).save
  end

  def self.follow(user_id, author_id)
    Notice.new(author_id: author_id, users_id: user_id, notice_type_id: 1).save
  end

  def self.unfollow(user_id, author_id)
    Notice.delete_by(author_id: author_id, users_id: user_id, notice_type_id: 1)
  end
end
