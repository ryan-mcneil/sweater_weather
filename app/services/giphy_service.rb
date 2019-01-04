class GiphyService

  def initialize(summary)
    @_summary = summary
  end

  def get_gif_json
    conn = Faraday.new(url: "https://api.giphy.com")
    response = conn.get("/v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{@_summary}&limit=10&offset=0&rating=R&lang=en")

    data = JSON.parse(response.body, symbolize_names: true)
  end
end
