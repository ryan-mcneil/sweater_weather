require 'rails_helper'

describe 'gif_forecast' do

  let :attrs {
    {
      id: 1234,
      daily_forecasts: []
    }
  }
  subject { GifForecast.new(attrs) }

  it 'exists' do
    expect(subject).to be_a GifForecast
    expect(subject.daily_forecasts).to eq []
  end

  context 'class methods' do
    context '::load_data' do
      it 'should load data from coords' do
        stub_location_request
        stub_forecast_request
        stub_giphy_request
        coords = '39.7392358,-104.990251'

        gif_forecast = GifForecast.load_data(coords)

        expect(gif_forecast.daily_forecasts.size).to eq 8
        expect(gif_forecast.daily_forecasts[0].time).to eq "1546498800"
        expect(gif_forecast.daily_forecasts[0].summary).to eq "Clear throughout the day."
        expect(gif_forecast.daily_forecasts[0].url).to eq "https://giphy.com/gifs/water-ocean-sea-ivcVZnZAEqhs4"

      end
    end
  end
end
