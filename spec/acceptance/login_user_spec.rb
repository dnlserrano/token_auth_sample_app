require 'acceptance_spec_helper'

RSpec.describe 'when logging a user in', type: :request do
  let(:endpoint) { user_session_path }
  let(:request) {
    {
      user: {
        email:    email,
        password: password,
      }
    }
  }

  include_context 'json headers'
  include_context 'database has a registered user'

  it 'returns an authentication token' do
    post endpoint, JSON.dump(request), headers

    expect(response).to have_http_status(201)

    json = JSON.parse(response.body)
    expect(json['token']).to_not be_empty
  end

  context 'when password is incorrect' do
    let(:request) {
      {
        user: {
          email:    email,
          password: 'incorrect',
        }
      }
    }

    it 'returns an error' do
      post endpoint, JSON.dump(request), headers

      expect(response).to have_http_status(401)

      json = JSON.parse(response.body)
      expect(json['error']).to eq 'Invalid email or password.'
    end
  end
end
