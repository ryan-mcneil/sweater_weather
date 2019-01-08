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
    hash[:current_weather] = Forecast.load_data(coords, location)
    hash
  end
end
