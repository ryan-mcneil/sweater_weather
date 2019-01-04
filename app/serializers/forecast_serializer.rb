class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weather, :hourly_forecast, :daily_forecast
end
