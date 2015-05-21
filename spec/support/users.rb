module Support
  extend self

  def user_one
    User.new(
      username: 'rfederer',
      email:    'rfederer@atp.com',
      password:              '1h29t3un48tu309',
      password_confirmation: '1h29t3un48tu309'
    )
  end

  def user_two
    User.new(
      username:              'rnadal',
      email:                 'rnadal@atp.com',
      password:              '903ut84nu3t92h1',
      password_confirmation: '903ut84nu3t92h1'
    )
  end
end
