require 'rails_helper'

describe 'POST new favorite' do
  it 'creates a new favorite' do
    user = create(:user, email: 'whatever@example.com', password: 'password')

    expect(user.favorites.count).to eq 0
    post "/api/v1/favorites?location=denver,co&api_key=#{user.api_key}"

    expect(response.status).to eq 201

    expect(user.favorites.count).to eq 1
    expect(user.favorites[0].location).to eq "denver,co"

  end

  it 'does not create a new favorite if location already exists in db' do
    user = create(:user, email: 'whatever@example.com', password: 'password')
    user.favorites.create(location: "denver,co")
    expect(user.favorites.count).to eq 1
    post "/api/v1/favorites?location=denver,co&api_key=#{user.api_key}"

    expect(response.status).to eq 201

    expect(user.favorites.count).to eq 1
    expect(user.favorites[0].location).to eq "denver,co"

  end

  it 'returns a 401 if the wrong API key is used' do
    user = create(:user, email: 'whatever@example.com', password: 'password')

    post "/api/v1/favorites?location=denver,co&api_key=1234"

    expect(response.status).to eq 401
  end

  it 'returns a 401 if no API key is included' do
    user = create(:user, email: 'whatever@example.com', password: 'password')

    post "/api/v1/favorites?location=denver,co"

    expect(response.status).to eq 401
  end
end
