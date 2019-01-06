require 'rails_helper'


describe 'user_login' do
  it 'logs in user and sends use_api_key' do

    user = create(:user, email: 'whatever@example.com', password: 'password')

    post '/api/v1/sessions?email=whatever@example.com&password=password'

    expect(response.status).to eq 200

    data = JSON.parse(response.body)
    expect(data["data"]["attributes"]["api_key"].size).to eq 30

  end

  it 'returns a message if credentials are incorrect' do
    VCR.use_cassette("user_login_request") do

      user = create(:user, email: 'whatever@example.com', password: 'password')

      post '/api/v1/sessions?email=whatever@example.com&password=wrongpassword'

      expect(response.status).to eq 200

      data = response.body
      expect(data).to eq "An incorrect email or password has been entered"
    end
  end


end
