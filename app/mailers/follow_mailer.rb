class FollowMailer < ApplicationMailer

    # When current user start follow to another user - send to current user
    def startFollowToUser(current_user, user)
        @user = user
        mail(to: current_user.email, subject: 'You are follow to ' + @user.name)
    end
end
