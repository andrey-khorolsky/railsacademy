class UserController < ApplicationController

    def create
        user = User.new(params['name'], params['email'], params['password'])
        user.save
    end

    def show

        user = User.find_by(rowid: params['id'])
        # user = User.new(asd, qwe, qwe)
        render plain: user.to_s

    end

end
