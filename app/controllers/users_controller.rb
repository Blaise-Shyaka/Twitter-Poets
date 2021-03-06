class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if user_exists
      flash.now[:notice] = 'Account already exists'
      render './users/new'
      return
    end

    if @user.save
      redirect_to new_session_path, notice: 'Account created successfully'
    else
      render :new
      flash.now[:notice] = 'Failed to create an account'
    end
  end

  def new; end

  def show
    @user = User.includes(:tweets).find(params[:id])
    @followed_by = @user.followers.last(5)
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname)
  end

  def user_exists
    User.find_by(username: user_params[:username]) ? true : false
  end
end
