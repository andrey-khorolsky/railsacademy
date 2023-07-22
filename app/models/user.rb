class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :img
  mount_uploader :img, AvatarUploader

  def self.getImg(id)
    if User.find(id)[:img].blank?
      return '/uploads/user.jpg'
    else
      return User.find(id).img
    end
  end

  def self.getName
    User.find(user_id)[:name]
  end
end
