class DayForecast

  def initialize(args)
    @summary = args[:summary]
    @precip = args[:precip]
    @high = args[:high]
    @low = args[:low]
  end

  def self.read(data)
    DayForecast.new({
      summary: data[:summary],
      precip: data[:precipProbability],
      high: data[:temperatureHigh].round,
      low: data[:temperatureLow].round
      })
  end
end
