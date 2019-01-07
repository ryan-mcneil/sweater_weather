class UserFavoritesSerializer
  include FastJsonapi::ObjectSerializer

  attribute :favorites do |object|
    a = object.favorites.map do |favorite|
      favorite_to_hash(favorite.location)
    end
  end

  private

  def self.favorite_to_hash(location)
    hash = {}
    hash[:location] = location
    coords = GoogleService.new(location).get_coords
    forecast_data = DarkskyService.new(coords).get_forecast_json
    hash[:current_weather] = CurrentWeather.read(forecast_data, location)
    hash
  end
end
