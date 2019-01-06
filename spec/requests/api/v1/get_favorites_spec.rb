require 'rails_helper'

describe 'gets favorite' do
  it 'creates a new favorite' do
    user = create(:user, email: 'whatever@example.com', password: 'password')
    favorite_1 = user.favorites.create(location: "denver,co")
    favorite_2 = user.favorites.create(location: "chicago,il")

    get "/api/v1/favorites?api_key=#{user.api_key}"

    expect(response.status).to eq 200
    favorites = JSON.parse(response.body, symbolize_names: true)

  end
end
