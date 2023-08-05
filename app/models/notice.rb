class Notice < ApplicationRecord
  belongs_to :notice_type

  # add a like notice
  def self.like(user_id, post_id)
    Notice.new(author_id: User.find(Post.find(post_id).user_id).id, users_id: user_id, posts_id: post_id,
               notice_type_id: 2).save
  end

  # delete like notice
  def self.dislike(user_id, post_id)
    Notice.delete_by(author_id: User.find(Post.find(post_id).user_id).id, users_id: user_id, posts_id: post_id,
                     notice_type_id: 2)
  end

  # add a comment notice
  def self.comment(user_id, post_id, comment_id)
    Notice.new(author_id: User.find(Post.find(post_id).user_id).id, users_id: user_id, posts_id: post_id, comments_id: comment_id,
               notice_type_id: 3).save
  end

  # add a follow notice
  def self.follow(user_id, author_id)
    Notice.new(author_id: author_id, users_id: user_id, notice_type_id: 1).save
  end

  # delete a follow notice
  def self.unfollow(user_id, author_id)
    Notice.delete_by(author_id: author_id, users_id: user_id, notice_type_id: 1)
  end

  # get time of notice
  def get_time
    time = Time.now - created_at
    case time
    when 0..60
      'less than a minute'
    when 61..3600
      (time/60).round.to_s+' minutes'
    when 3601..86400
      (time/3600).round.to_s+' hours'
    when 86401..700000
      (time/86400).round.to_s+' days'
    end
  end
end
