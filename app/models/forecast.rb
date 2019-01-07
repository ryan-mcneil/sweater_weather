class Forecast
  attr_reader :current_weather,
              :hourly_forecast,
              :daily_forecast,
              :id

  def initialize(args)
    @id = SecureRandom.uuid
    @current_weather = args[:current_weather]
    @hourly_forecast = args[:hourly_forecast]
    @daily_forecast = args[:daily_forecast]
  end

  def self.load_data(coords, location)
    forecast_data = DarkskyService.new(coords).get_forecast_json

    forecast = Forecast.new({
                              current_weather: get_current_weather(forecast_data, location),
                              hourly_forecast: get_hourly_forecast(forecast_data),
                              daily_forecast: get_daily_forecast(forecast_data)
                            })
  end

  private

  def self.get_current_weather(data, location)
    @current_weather = CurrentWeather.read(data, location)
  end

  def self.get_hourly_forecast(data)
    limited_data = data[:hourly][:data][0..7]
    @hourly_forecast = limited_data.map do |hour_data|
      HourForecast.read(hour_data)
    end
  end

  def self.get_daily_forecast(data)
    limited_data = data[:daily][:data][0..4]
    @daily_forecast = limited_data.map do |day_data|
      DayForecast.read(day_data)
    end
  end
end
