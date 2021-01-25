RSpec.describe 'Login user', type: :feature do
  let(:user) { User.create(username: 'eric', fullname: 'Eric') }
  let(:wrong_username) { 'wrong username' }

  it 'should redirect to the tweets#index page if signin is successful' do
    visit root_path
    fill_in 'username', with: user.username
    click_button 'Sign in'
    expect(page).to have_button('Tweet')
  end

  it 'should render the sign in form if the user does not exist' do
    visit root_path
    p wrong_username
    fill_in 'username', with: wrong_username
    click_button 'Sign in'
    expect(page).to have_content('Sign in failed')
  end
end