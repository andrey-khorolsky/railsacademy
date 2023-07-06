class Post < ApplicationRecord
  has_one_attached :img
  mount_uploader :img, PostimgUploader

  def hasLikeFrom user_id
    return Like.where('post_id = ? and user_id = ?', id, user_id).count == 0
  end

  def self.findPostsBy user_id
    return self.where('user_id = ?', user_id)
  end

end
