class DayForecast
  attr_reader :day,
              :summary,
              :precip,
              :high,
              :low

  def initialize(args)
    @day = args[:day]
    @summary = args[:summary]
    @precip = args[:precip]
    @high = args[:high]
    @low = args[:low]
  end

  def self.read(data)
    DayForecast.new({
      day: format_date_time(Time.at(data[:time])),
      summary: data[:summary],
      precip: data[:precipProbability],
      high: data[:temperatureHigh].round,
      low: data[:temperatureLow].round
      })
  end

  private

  def self.format_date_time(date_time)
    date_time.strftime("%A")
  end
end
