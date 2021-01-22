class TweetsController < ApplicationController

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet created successfully'
    end
  end

  def new
    @tweet = Tweet.new
  end

  def index
    @tweets = current_user.tweets
  end

  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
