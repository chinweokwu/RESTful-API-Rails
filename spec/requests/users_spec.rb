require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'POST /register' do
    it 'authenticates the user' do
      post '/api/v1/register', params: { user: { username: 'paul', password: 'password' } }
      expect(response).to have_http_status(:created)
      expect(json).to eq ({
                            'id' => User.last.id,
                            'username' => 'paul',
                            'token' => AuthenticationTokenService.call(User.last.id)
                          })
                          
    end
  end
end
