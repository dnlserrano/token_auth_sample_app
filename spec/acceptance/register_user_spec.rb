require 'acceptance_spec_helper'

RSpec.describe 'when registering a user', type: :request do
  let(:endpoint) { user_registration_path }
  let(:email)    { 'dnlserrano@mail.com' }
  let(:username) { 'dnlserrano' }
  let(:password) { '1h29t3un48tu309' }
  let(:request) {
    {
      user: {
        email:                 email,
        username:              username,
        password:              password,
        password_confirmation: password
      }
    }
  }

  include_context 'json headers'

  it 'returns the user data' do
    post endpoint, JSON.dump(request), headers

    expect(response).to have_http_status(201)

    json = JSON.parse(response.body)
    expect(json['username']).to eq username
  end

  context 'when password is not long enough' do
    let(:password) { '123' }

    it 'returns an error' do
      post endpoint, JSON.dump(request), headers

      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)
      expect(json['errors']).to be_a(Hash)
      expect(json['errors']['password'][0]).to eq 'is too short (minimum is 8 characters)'
    end
  end
end
