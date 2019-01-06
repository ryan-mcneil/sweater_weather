require 'rails_helper'

describe Forecast do
  let :attrs {
    {
      current_weather: "an object",
      hourly_forecast: ["objects"],
      daily_forecast: ["objects"]
    }
  }
  subject { Forecast.new(attrs) }

  it 'exists' do
    expect(subject).to be_a Forecast
  end

  context 'class methods' do
    context '::load_data' do
      it 'loads data into attributes' do
        stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['GOOGLE_API_KEY']}").
          to_return(body: File.read('spec/fixtures/location.json'))

        coords = '39.7392358,-104.990251'
        stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/#{coords}?exclude=[minutely,flags,alerts]").
          to_return(body: File.read('spec/fixtures/denver_forecast.json'))

        forecast = Forecast.load_data(coords, "denver,co")

        expect(forecast.current_weather).to be_a CurrentWeather
        expect(forecast.hourly_forecast[0]).to be_a HourForecast
        expect(forecast.daily_forecast[0]).to be_a DayForecast
      end
    end
  end

end
