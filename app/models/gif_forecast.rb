class GifForecast
  attr_reader :id, :daily_forecasts

  def initialize(args)
    @id = SecureRandom.uuid
    @daily_forecasts = args[:daily_forecasts]
    @_daily_data
  end

  def self.load_data(coords)
    # Please give me feedback on if this was a good use of memoization.
    # I have yet to fully grasp when to pull it out
    @_daily_data ||= DarkskyService.new(coords).get_forecast_json[:daily][:data]
    GifForecast.new({
      daily_forecasts: daily_forecasts(@_daily_data)
      })
  end

  private

  def self.daily_forecasts(daily_data)
    daily_data.map do |day_data|
      WeatherGif.read(day_data)
    end
  end
end
