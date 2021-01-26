class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: session_params[:username])
    if @user
      session[:current_user_id] = @user.id
      redirect_to tweets_path, notice: 'User signed in successfully'
    else
      redirect_to new_session_path
      flash.notice = 'Sign in failed'
    end
  end

  def new; end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out successfully'
  end

  private

  def session_params
    params.permit(:authenticity_token, :username, :commit)
  end
end
