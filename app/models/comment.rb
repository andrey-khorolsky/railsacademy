class Comment < ApplicationRecord
  validates :text, uniqueness: { scope: %i[user_id post_id] }

  # Find last (count) comments
  def self.getLastComments(post_id, count = 3)
    where('post_id = ?', post_id).order(created_at: :desc).limit(count)
  end

  # Find comment's author name
  def getAuthorsName
    User.getName user_id
  end

  # Find comment's author avatar
  def getAuthorsAvatar
    User.getImg user_id
  end
end
