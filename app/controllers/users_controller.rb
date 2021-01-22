class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: 'Account created successfully'
    else
      render :new
      flash.now[:notice] = 'Failed to create an account'
    end
  end

  def new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :fullname)
  end
end
