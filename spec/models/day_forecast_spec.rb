require 'rails_helper'

describe DayForecast do
  let :attrs {
    {
      summary: "Clear throughout the day.",
      precip: 0.02,
      high: 49,
      low: 28
    }
  }
  subject { DayForecast.new(attrs) }

  it 'exists' do
    expect(subject).to be_a DayForecast
  end

  context 'class methods' do
    context '::read' do
      it 'reads data and returns DayForecast object' do
        data =  {
          time: 1546498800,
          summary: "Clear throughout the day.",
          icon: "clear-day",
          sunriseTime: 1546525344,
          sunsetTime: 1546559330,
          moonPhase: 0.93,
          precipIntensity: 0.0005,
          precipIntensityMax: 0.0022,
          precipIntensityMaxTime: 1546549200,
          precipProbability: 0.02,
          precipAccumulation: 0.031,
          precipType: "snow",
          temperatureHigh: 48.56,
          temperatureHighTime: 1546549200,
          temperatureLow: 28.3,
          temperatureLowTime: 1546610400,
          apparentTemperatureHigh: 48.56,
          apparentTemperatureHighTime: 1546549200,
          apparentTemperatureLow: 21.51,
          apparentTemperatureLowTime: 1546610400,
          dewPoint: 15.13,
          humidity: 0.49,
          pressure: 1017.31,
          windSpeed: 3.35,
          windGust: 9.35,
          windGustTime: 1546574400,
          windBearing: 213,
          cloudCover: 0,
          uvIndex: 2,
          uvIndexTime: 1546538400,
          visibility: 10,
          ozone: 286.76,
          temperatureMin: 19.62,
          temperatureMinTime: 1546506000,
          temperatureMax: 48.56,
          temperatureMaxTime: 1546549200,
          apparentTemperatureMin: 14.98,
          apparentTemperatureMinTime: 1546506000,
          apparentTemperatureMax: 48.56,
          apparentTemperatureMaxTime: 1546549200
        }

        day_forecast = DayForecast.read(data)

        expect(day_forecast.summary).to eq "Clear throughout the day."
        expect(day_forecast.precip).to eq 0.02
        expect(day_forecast.high).to eq 49
        expect(day_forecast.low).to eq 28

      end
    end
  end
end
