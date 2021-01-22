class UpvotesController < ApplicationController
  def create
    @page = upvotes_params[:page]
    p @page
    @upvote = Upvote.new(user_id: upvotes_params[:user_id], tweet_id: upvotes_params[:tweet_id])
    if @upvote.save
      redirect_to @page
    end
  end

  private

  def upvotes_params
    params.require(:upvotes).permit(:user_id, :tweet_id, :page)
  end
end
