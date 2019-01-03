class DarkskyService

  def initialize(coords)
    @_coords = coords
  end

  def get_forecast_json
    data = get_json("/forecast/#{ENV['DARKSKY_API_KEY']}/#{@_coords}?exclude=[minutely,flags,alerts]")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.darksky.net')
  end

end
