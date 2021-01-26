# rubocop:disable Layout/LineLength
class TweetsController < ApplicationController
  def create
    @tweet = current_user.tweets.new(tweet_params)
    return unless @tweet.save

    redirect_to tweets_path, notice: 'Tweet created successfully'
  end

  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc).all
    @to_follow = User.order(created_at: :desc).first(5).filter { |user| !current_user.followeds.include?(user) && user != current_user }
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
# rubocop:enable Layout/LineLength
