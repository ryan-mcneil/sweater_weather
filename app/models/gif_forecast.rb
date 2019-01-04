class GifForecast
  attr_reader :daily_forecasts, :copyright

  def initialize(args)
    @daily_forecasts = args[:daily_forecasts]
    @copyright = args[:copyright]
  end

  def self.load_data(coords)
    daily_data = DarkskyService.new(coords).get_forecast_json[:daily]
    binding.pry
    daily_forecasts = daily_data.map do |day_data|
      WeatherGif.read(day_data)
    end

    GifForecast.new({
      daily_forecasts: daily_forecasts,
      copyright: "2018"
      })
  end

end
