RSpec.shared_context 'database has a registered user' do
  let(:email)    { 'dnlserrano@mail.com' }
  let(:username) { 'dnlserrano' }
  let(:password) { '1h29t3un48tu309' }
  let(:user) {
    User.new(
      email:                 email,
      username:              username,
      password:              password,
      password_confirmation: password
    )
  }

  before(:each) do
    user.save
  end
end
