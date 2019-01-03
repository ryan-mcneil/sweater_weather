class Forecast

  def initialize
    @current_weather = nil
    @hourly_forecast = []
    @daily_forecast = []
  end

  def load_data(coords)
    forecast_data = DarkskyService.new(coords).get_forecast_json
    set_current_weather(forecast_data)
    set_hourly_forecast(forecast_data)
    set_daily_forecast(forecast_data)
  end

  private

  def set_current_weather(data)
    # @current_weather = CurrentDay.read(data)
  end

  def set_hourly_forecast(data)
    # limited_data = data[:hourly]
    # @hours = CurrentDay.read(data)
  end

  def set_daily_forecast(data)

  end
end
