require 'rails_helper'

describe 'DELETE  favorite' do
  it 'deletes a favorite' do
    user = create(:user, email: 'whatever@example.com', password: 'password')
    user.favorites.create(location: "denver,co")

    expect(user.favorites.count).to eq 1
    delete "/api/v1/favorites?location=denver,co&api_key=#{user.api_key}"

    expect(response.status).to eq 200
    expect(user.favorites.count).to eq 0

  end

  it 'returns a 401 if the wrong API key is used' do
    user = create(:user, email: 'whatever@example.com', password: 'password')

    delete "/api/v1/favorites?location=denver,co&api_key=1234"

    expect(response.status).to eq 401
  end

  it 'returns a 401 if no API key is included' do
    user = create(:user, email: 'whatever@example.com', password: 'password')

    delete "/api/v1/favorites?location=denver,co"

    expect(response.status).to eq 401
  end

end
