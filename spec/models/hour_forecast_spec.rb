require 'rails_helper'

describe HourForecast do
  let :attrs {
    {
      time: "8 AM",
      temp: 24
    }
  }
  subject { HourForecast.new(attrs) }

  it 'exists' do
    expect(subject).to be_a HourForecast
  end

  context 'class methods' do
    context '::read' do
      it 'reads data and returns HourForecast object' do
        data =  {
          time: 1546527600,
          summary: "Clear",
          icon: "clear-day",
          precipIntensity: 0.0006,
          precipProbability: 0.01,
          precipAccumulation: 0.008,
          precipType: "snow",
          temperature: 24.19,
          apparentTemperature: 18.89,
          dewPoint: 8.67,
          humidity: 0.51,
          pressure: 1017.76,
          windSpeed: 4.14,
          windGust: 7.36,
          windBearing: 214,
          cloudCover: 0,
          uvIndex: 0,
          visibility: 6.26,
          ozone: 283.94
        }

        hour_forecast = HourForecast.read(data)

        expect(hour_forecast.time).to eq "8 AM"
        expect(hour_forecast.temp).to eq 24

      end
    end
  end
end
