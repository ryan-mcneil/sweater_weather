require 'rails_helper'

describe 'Giphy API' do
  it 'sends gifs for each day in forecast' do
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['GOOGLE_API_KEY']}").
      to_return(body: File.read('spec/fixtures/location.json'))

    coords = '39.7392358,-104.990251'
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{coords}?exclude=[minutely,flags,alerts]").
      to_return(body: File.read('spec/fixtures/denver_forecast.json'))

    stub_request(:get, "https://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=Clear throughout the day.&limit=10&offset=0&rating=R&lang=en").
      to_return(body: File.read('spec/fixtures/gifs.json'))

    get '/api/v1/gifs?location=denver,co'

    expect(response.status).to eq 200

    gif_forecast = JSON.parse(response.body, symbolize_names: true)
    expect(gif_forecast[:data][:daily_forecasts].count).to eq 8
    expect(gif_forecast[:data][:daily_forecasts][0][:time]).to eq 1546498800
    expect(gif_forecast[:data][:daily_forecasts][0][:summary]).to eq "Clear throughout the day."
    expect(gif_forecast[:data][:daily_forecasts][0][:url]).to eq ""
  end
end
