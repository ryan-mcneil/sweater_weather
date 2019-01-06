require 'rails_helper'

describe 'POST new user' do
  it 'creates a new user and sends response from post request' do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'
    expect(response.status).to eq 200

    data = JSON.parse(response.body)
    expect(data["data"]["attributes"]["api_key"].size).to eq 30

  end
end
