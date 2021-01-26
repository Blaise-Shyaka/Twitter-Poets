require 'rails_helper'

RSpec.describe Upvote, type: :model do
  before(:each) do
    @upvote = Upvote.new(user_id: 1, tweet_id: 2)
  end

  it 'Should be invalid if no user_id is provided' do
    @upvote.user_id = nil
    expect(@upvote).to_not be_valid
  end

  it 'Should be invalid if no tweet_id is provided' do
    @upvote.tweet_id = nil
    expect(@upvote).to_not be_valid
  end

  it { should belong_to(:user) }

  it { should belong_to(:tweet) }
end
