class GifForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :daily_forecasts, :copyright
end
