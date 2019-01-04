class GifForecast
  attr_reader :daily_forecasts, :copyright

  def initialize(args)
    @daily_forecasts = args[:daily_forecasts]
    @copyright = args[:copyright]
  end
end
