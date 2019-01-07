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
        stub_location_request
        stub_forecast_request

        coords = '39.7392358,-104.990251'
        forecast = Forecast.load_data(coords, "denver,co")

        expect(forecast.current_weather).to be_a CurrentWeather
        expect(forecast.hourly_forecast[0]).to be_a HourForecast
        expect(forecast.daily_forecast[0]).to be_a DayForecast
      end
    end
  end

end
