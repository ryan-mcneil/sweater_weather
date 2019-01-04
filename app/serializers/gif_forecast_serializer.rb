class GifForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :daily_forecasts

  attribute :copyright do
    "2018"
  end
end
