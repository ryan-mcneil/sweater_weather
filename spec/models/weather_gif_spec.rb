require 'rails_helper'

describe 'WeatherGif' do
  let :attrs {
    {
      time: "1546498800",
      summary: "Clear throughout the day.",
      url: "https://giphy.com/gifs/water-ocean-sea-ivcVZnZAEqhs4"
    }
  }
  subject { WeatherGif.new(attrs) }

  it 'exists' do
    expect(subject).to be_a WeatherGif
    expect(subject.time).to eq "1546498800"
    expect(subject.summary).to eq "Clear throughout the day."
    expect(subject.url).to eq "https://giphy.com/gifs/water-ocean-sea-ivcVZnZAEqhs4"
  end

  context 'class methods' do
    context '::read' do
      it 'reads day data and returns a WeatherGif object' do
        stub_giphy_request
        
        data = {
          time: "1546498800",
          summary: "Clear throughout the day."
        }
        weather_gif = WeatherGif.read(data)

        expect(weather_gif.time).to eq "1546498800"
        expect(weather_gif.summary).to eq "Clear throughout the day."
        expect(weather_gif.url).to eq "https://giphy.com/gifs/water-ocean-sea-ivcVZnZAEqhs4"

      end
    end
  end

end
