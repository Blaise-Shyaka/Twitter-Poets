class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = 'Account created successfully'
    else
      render :new
      flash.now[:notice] = 'Failed to create an account'
    end
  end

  def new
  end

  def show
  end

  def user_params
    params.require(:user).permit(:username, :fullname)
  end
end
