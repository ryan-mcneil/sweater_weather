require 'rails_helper'

describe 'Giphy API' do
  it 'sends gifs for each day in forecast' do
    stub_location_request
    stub_forecast_request
    stub_giphy_request

    get '/api/v1/gifs?location=denver,co'

    expect(response.status).to eq 200
    gif_forecast = JSON.parse(response.body, symbolize_names: true)

    expect(gif_forecast[:data][:attributes][:daily_forecasts].count).to eq 8
    expect(gif_forecast[:data][:attributes][:daily_forecasts][0][:time]).to eq "1546498800"
    expect(gif_forecast[:data][:attributes][:daily_forecasts][0][:summary]).to eq "Clear throughout the day."
    expect(gif_forecast[:data][:attributes][:daily_forecasts][0][:url]).to eq "https://giphy.com/gifs/water-ocean-sea-ivcVZnZAEqhs4"
  end
end
