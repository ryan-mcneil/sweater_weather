class GoogleService

  def initialize(city)
    @_city = city
  end

  def get_coords
    data = get_json("/maps/api/geocode/json?address=#{@_city}&key=#{ENV['GOOGLE_API_KEY']}")
    coords = data[:results][0][:geometry][:location]
    "#{coords[:lat]},#{coords[:lng]}"
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com')
  end
end
