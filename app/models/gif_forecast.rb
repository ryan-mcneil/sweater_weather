class GifForecast
  attr_reader :id, :daily_forecasts

  def initialize(args)
    @id = SecureRandom.uuid
    @daily_forecasts = args[:daily_forecasts]
  end

  def self.load_data(coords)
    GifForecast.new({
      daily_forecasts: daily_forecasts(coords)
      })
  end

  private

  def self.daily_forecasts(coords)
    daily_data(coords).map do |day_data|
      WeatherGif.read(day_data)
    end
  end

  def self.daily_data(coords)
    DarkskyService.new(coords).get_forecast_json[:daily][:data]
  end
end
