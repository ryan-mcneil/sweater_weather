require 'rails_helper'

describe 'gets favorite' do
  it 'creates a new favorite' do
    stub_location_request
    stub_forecast_request

    user = create(:user, email: 'whatever@example.com', password: 'password')
    favorite_1 = user.favorites.create(location: "denver,co")

    get "/api/v1/favorites?api_key=#{user.api_key}"

    expect(response.status).to eq 200
    favorites = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:favorites]

    expect(favorites.count).to eq 1
    expect(favorites[0][:location]).to eq "denver,co"
    expect(favorites[0][:current_weather][:current_weather][:summary]).to eq "Clear"
  end

  it 'returns a 401 if the wrong API key is used' do
    user = create(:user, email: 'whatever@example.com', password: 'password')

    expect(user.favorites.count).to eq 0
    get "/api/v1/favorites?api_key=1234"

    expect(response.status).to eq 401
  end

  it 'returns a 401 if no API key is included' do
    user = create(:user, email: 'whatever@example.com', password: 'password')

    expect(user.favorites.count).to eq 0
    get "/api/v1/favorites"

    expect(response.status).to eq 401
  end
end
