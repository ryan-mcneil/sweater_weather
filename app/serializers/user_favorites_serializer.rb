class UserFavoritesSerializer
  include FastJsonapi::ObjectSerializer

  attribute :favorites do |object|
    a = object.favorites.map do |favorite|
      hash = {}
      hash[:location] = favorite.location
      coords = GoogleService.new(favorite.location).get_coords
      forecast_data = DarkskyService.new(coords).get_forecast_json
      hash[:current_weather] = CurrentWeather.read(forecast_data, favorite.location)
      hash
    end
  end
end
