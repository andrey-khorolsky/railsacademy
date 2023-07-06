class Post < ApplicationRecord
  has_one_attached :img
  mount_uploader :img, PostimgUploader

  def hasLikeFrom user_id
    # binding.pry
    return Like.where('post_id = ? and user_id = ?', id, user_id).count == 0
  end

end
