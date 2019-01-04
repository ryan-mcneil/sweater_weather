class WeatherGif
  attr_reader :time, :summary, :url

  def initialize(args)
    @time =  args[:time]
    @summary =  args[:summary]
    @url =  args[:url]
  end

  def self.read(data)
    WeatherGif.new({
      time: data[:time],
      summary: data[:summary],
      url: find_gif(data[:summary])
      })
  end

  private

  def self.find_gif(summary)
    binding.pry
    conn = Faraday.new(url: "https://api.giphy.com")
    response = conn.get("/v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{summary}&limit=10&offset=0&rating=R&lang=en")

    data = JSON.parse(response.body, symbolize_names: true)
    gif = data[:data][0][:url]
  end
end
