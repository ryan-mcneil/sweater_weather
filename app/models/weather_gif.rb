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
    gif_data = GiphyService.new(summary).get_gif_json
    gif = gif_data[:data][0][:url]
  end
end
