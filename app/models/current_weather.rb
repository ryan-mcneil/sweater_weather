class CurrentWeather
  attr_reader :summary,
              :temp,
              :high,
              :low,
              :location,
              :date_time,
              :hourly_summary,
              :feels_like,
              :humidity,
              :visibility,
              :uv


  def initialize(args)
    @summary = args[:summary]
    @temp = args[:temp]
    @high = args[:high]
    @low = args[:low]
    @location = args[:location]
    @date_time = args[:date_time]
    @hourly_summary = args[:hourly_summary]
    @feels_like = args[:feels_like]
    @humidity = args[:humidity]
    @visibility = args[:visibility]
    @uv = args[:uv]
  end

  def self.read(data, location)
    CurrentWeather.new({
      summary: data[:currently][:summary],
      temp: data[:currently][:temperature].round,
      high: data[:daily][:data][0][:temperatureHigh].round,
      low: data[:daily][:data][0][:temperatureLow].round,
      location: location,
      date_time: format_date_time(Time.at(data[:currently][:time])),
      hourly_summary: data[:hourly][:summary],
      feels_like: data[:currently][:apparentTemperature].round,
      humidity: data[:currently][:humidity],
      visibility: data[:currently][:visibility],
      uv: data[:currently][:uvIndex],
    })
  end

  private

  def self.format_date_time(date_time)
    date_time.strftime("%l:%M %p %Z(%:z), %-m/%-d").lstrip
  end
end
