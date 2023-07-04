class UserController < ApplicationController
  def index
    @user = User.all
  end

  def create
    @user = User.new(params.required(:user).permit(:name, :email, :password))
    @user.save

    redirect_to '/user'
  end

  def show
    @user = User.find(params['id'])
  end
end
