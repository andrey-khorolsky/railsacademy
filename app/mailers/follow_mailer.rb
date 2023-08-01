class FollowMailer < ApplicationMailer
  # When user have a new follower
  def newFollower(current_user, user)
    @follower = current_user
    @author = user
    mail(to: user.email, subject: 'You have a new follower')
  end
end
