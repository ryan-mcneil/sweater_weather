require 'rails_helper'

describe 'POST new favorite' do
  it 'creates a new favorite' do
    user = create(:user, email: 'whatever@example.com', password: 'password')

    expect(user.favorites.count).to eq 0
    post "/api/v1/favorites?location=denver,co&api_key=#{user.api_key}"

    expect(user.favorites.count).to eq 1
    expect(user.favorites[0].location).to eq "denver,co"

  end

  xit 'returns a 401 if the wrong API key is used' do
    user = create(:user, email: 'whatever@example.com', password: 'password')

    expect(user.favorites.count).to eq 0
    post "/api/v1/favorites?location=denver,co&api_key=1234"

    expect(response.status).to eq 401
  end
end
