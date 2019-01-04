class GifForecast
  attr_reader :id, :daily_forecasts, :copyright

  def initialize(args)
    @id = SecureRandom.uuid
    @daily_forecasts = args[:daily_forecasts]
    @copyright = args[:copyright]
  end

  def self.load_data(coords)
    daily_data = DarkskyService.new(coords).get_forecast_json[:daily][:data]
    daily_forecasts = daily_data.map do |day_data|
      WeatherGif.read(day_data)
    end
    GifForecast.new({
      daily_forecasts: daily_forecasts,
      copyright: "2018"
      })
  end

end
