require 'rails_helper'

describe 'Forecast API' do
  it 'sends forecast information' do
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['GOOGLE_API_KEY']}").
      to_return(body: File.read('spec/fixtures/location.json'))

    coords = '39.7392358,-104.990251'
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{coords}?exclude=[minutely,flags,alerts]").
      to_return(body: File.read('spec/fixtures/denver_forecast.json'))

    get '/api/v1/forecast?location=denver,co'

    # expect(response).to be_successful
    expect(response.status).to eq 200

    forecast = JSON.parse(response.body, symbolize_names: true)

    # expect(forecast.avg).to eq 50

  end
end
