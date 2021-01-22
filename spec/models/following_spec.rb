require 'rails_helper'

RSpec.describe Following, type: :model do
  before(:each) do
    @following = Following.new(follower_id: 1, followed_id: 2)
  end

  it 'Should be invalid without the follower_id' do
    @following.follower_id = nil
    expect(@following).to_not be_valid
  end

  it 'Should be invalid without the followed_id' do
    @following.followed_id = nil
    expect(@following).to_not be_valid
  end

  it { should belong_to(:follower).class_name('User') }

  it { should belong_to(:following).class_name('User').with_foreign_key('followed_id') }
end
