require 'rails_helper'

describe 'Forecast API' do
  it 'sends forecast information' do
    stub_location_request
    stub_forecast_request
    
    get '/api/v1/forecast?location=denver,co'

    # expect(response).to be_successful
    expect(response.status).to eq 200

    forecast = JSON.parse(response.body, symbolize_names: true)

    # expect(forecast.avg).to eq 50

  end
end
