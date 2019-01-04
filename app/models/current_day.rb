class CurrentDay
  attr_reader

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
    CurrentDay.new({
      summary: data[:currently][:summary],
      temp: data[:currently][:temperature],
      high: data[:daily][:data][0][:temperatureHigh],
      low: data[:daily][:data][0][:temperatureLow],
      location: location,
      date_time: Time.at(data[:currently][:time]),
      hourly_summary: data[:hourly][:summary],
      feels_like: data[:currently][:apparentTemperature],
      humidity: data[:currently][:humidity],
      visibility: data[:currently][:visibility],
      uv: data[:currently][:uvIndex],
    })
  end
end
