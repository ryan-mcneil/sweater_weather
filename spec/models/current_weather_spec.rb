require 'rails_helper'

describe CurrentWeather do
  let :attrs {
    {
      summary: "Clear",
      temp: 25,
      high: 49,
      low: 28,
      location: "denver,co",
      date_time: "8:06 AM, 1/3",
      hourly_summary: "Clear throughout the day.",
      feels_like: 19,
      humidity: 0.51,
      visibility: 6.9,
      uv: 0
    }
  }
  subject { CurrentWeather.new(attrs) }

  it 'exists' do
    expect(subject).to be_a CurrentWeather
  end

  context 'class methods' do
    context '::read' do
      it 'reads data and returns CurrentWeather object' do
        data = {
          latitude: 39.7392358,
          longitude: -104.990251,
          timezone: "America/Denver",
          currently: {
            time: 1546527963,
            summary: "Clear",
            icon: "clear-day",
            nearestStormDistance: 187,
            nearestStormBearing: 114,
            precipIntensity: 0,
            precipProbability: 0,
            temperature: 24.58,
            apparentTemperature: 19.46,
            dewPoint: 9.06,
            humidity: 0.51,
            pressure: 1017.79,
            windSpeed: 4.04,
            windGust: 7.27,
            windBearing: 216,
            cloudCover: 0,
            uvIndex: 0,
            visibility: 6.9,
            ozone: 283.95
          },
          hourly: {
            summary: "Clear throughout the day.",
            icon: "clear-day",
            data: [{
              time: 1546527600,
              summary: "Clear"
            }]
          },
          daily: {
            summary: "No precipitation throughout the week, with high temperatures bottoming out at 46°F on Sunday.",
            icon: "clear-day",
            data: [{
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
              temperatureLowTime: 1546610400
            }]
          }
        }
        location = 'denver,co'

        current_day = CurrentWeather.read(data, location)

        expect(current_day.summary).to eq "Clear"
        expect(current_day.temp).to eq 25
        expect(current_day.high).to eq 49
        expect(current_day.low).to eq 28
        expect(current_day.location).to eq "denver,co"
        expect(current_day.date_time).to eq "8:06 AM, 1/3"
        expect(current_day.hourly_summary).to eq "Clear throughout the day."
        expect(current_day.feels_like).to eq 19
        expect(current_day.humidity).to eq 0.51
        expect(current_day.visibility).to eq 6.9
        expect(current_day.uv).to eq 0
      end
    end
  end
end
