require 'rails_helper'

describe 'POST new user' do
  xit 'creates a new user from post request' do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation&password'

    expect(response.status).to eq 200
  end
end
