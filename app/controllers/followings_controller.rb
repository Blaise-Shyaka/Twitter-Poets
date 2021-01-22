class FollowingsController < ApplicationController
  def create
    @following = Following.new(following_params) unless current_user.followeds.include?(following_params[:followed_id])
    return unless @following.save

    redirect_to user_path(following_params[:followed_id])
  end

  private

  def following_params
    params.require(:following).permit(:follower_id, :followed_id)
  end
end
