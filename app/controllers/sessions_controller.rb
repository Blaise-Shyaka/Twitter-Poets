class SessionsController < ApplicationController

  def create
    @user = User.find_by(username: session_params[:name])
    if @user
      session[:current_user_id] = @user.id
      flash.notice = 'User signed in successfully'
    else
      redirect_to new_session
      flash.notice = 'Sign in failed'
    end
  end

  def new

  end

  def destroy
    reset_session
  end

  private

  def session_params
    params.permit(:authenticity_token, :name, :commit)
  end
end 