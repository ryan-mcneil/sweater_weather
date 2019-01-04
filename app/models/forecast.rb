class Forecast
  attr_reader :current_weather,
              :hourly_forecast,
              :daily_forecast

  def initialize(args)
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
    # get_current_weather(forecast_data)
    # get_hourly_forecast(forecast_data)
    # get_daily_forecast(forecast_data)
  end

  private

  def self.get_current_weather(data, location)
    @current_weather = CurrentDay.read(data, location)
  end

  def self.get_hourly_forecast(data)
    # limited_data = data[:hourly]
    # @hours = CurrentDay.read(data)
  end

  def self.get_daily_forecast(data)

  end
end
