class UpvotesController < ApplicationController
  def create
    @page = upvotes_params[:page]
    @upvote = Upvote.new(user_id: upvotes_params[:user_id], tweet_id: upvotes_params[:tweet_id])
    return unless @upvote.save

    redirect_to @page
  end

  private

  def upvotes_params
    params.require(:upvotes).permit(:user_id, :tweet_id, :page)
  end
end
