require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @new_user = User.new(username: 'my_name', fullname: 'my full name')
  end

  it 'Should be invalid if no username is provided' do
    @new_user.username = nil
    expect(@new_user).to_not be_valid
  end

  it 'Should be invalid if no fullname is provided' do
    @new_user.fullname = nil
    expect(@new_user).to_not be_valid
  end

  it 'Username length should not be less than 3 characters' do
    @new_user.username = 'hi'
    expect(@new_user).to_not be_valid
  end

  it 'Username length should not exceed 20 characters' do
    @new_user.username = 'jkahdf hajkhdlak jdhfajklh hakjhfsdk akhd'
    expect(@new_user).to_not be_valid
  end

  it 'Fullname length should not be less than 3 characters' do
    @new_user.fullname = 'hi'
    expect(@new_user).to_not be_valid
  end

  it 'Fullname length should not exceed 50 characters' do
    @new_user.fullname = 'jkahdf hajkhdlak jdhfajklh hakjhfsdk adfjdlajdh ajdhkjhdfklah'
    expect(@new_user).to_not be_valid
  end

  it { should have_many(:followers) }

  it { should have_many(:followeds) }

  it { should have_many(:tweets).with_foreign_key('author_id') }

  it { should have_many(:upvotes) }
end
