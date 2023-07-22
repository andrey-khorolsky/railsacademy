class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :img
  mount_uploader :img, AvatarUploader

  def self.getImg(id)
    return '/uploads/user.jpg' if User.find(id)[:img].blank?

    User.find(id).img
  end

  def self.getName(id)
    User.find(id)[:name]
  end
end
