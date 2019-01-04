require 'rails_helper'

describe 'gif_forecast' do

  let :attrs {
    {
      daily_forecasts: [],
      copyright: "2018"
    }
  }
  subject { GifForecast.new(attrs) }

  it 'exists' do
    expect(subject).to be_a GifForecast
    expect(subject.daily_forecasts).to eq []
    expect(subject.copyright).to eq "2018"
  end

  context 'class methods' do
    context '::load_data' do
      it 'should load data from coords' do
        stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['GOOGLE_API_KEY']}").
          to_return(body: File.read('spec/fixtures/location.json'))

        coords = '39.7392358,-104.990251'
        stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{coords}?exclude=[minutely,flags,alerts]").
          to_return(body: File.read('spec/fixtures/denver_forecast.json'))

        gif_forecast = GifForecast.load_data(coords)

        expect(gif_forecast.daily_forecasts.size).to eq 8
        expect(gif_forecast.daily_forecasts[0].time).to eq 1546498800
        expect(gif_forecast.daily_forecasts[0].summary).to eq "Clear throughout the day."

      end
    end
  end
end
