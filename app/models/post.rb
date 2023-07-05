class Post < ApplicationRecord
  has_one_attached :img
  mount_uploader :img, PostimgUploader
end
