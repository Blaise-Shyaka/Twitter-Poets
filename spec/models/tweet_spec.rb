require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before(:each) do
    @tweet = Tweet.new(author_id: 1, text: 'my first poem')
  end

  it 'Should be invalid if the author_id is not provided' do
    @tweet.author_id = nil
    expect(@tweet).to_not be_valid
  end

  it 'Should be invalid if the text is not provided' do
    @tweet.text = nil
    expect(@tweet).to_not be_valid
  end

  it { should belong_to(:user).with_foreign_key('author_id') }

  it { should have_many(:upvotes) }
end
