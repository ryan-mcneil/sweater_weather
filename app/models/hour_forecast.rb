class HourForecast
  attr_reader :time, :temp

  def initialize(args)
    @time = args[:time]
    @temp = args[:temp]
  end

  def self.read(data)
    HourForecast.new({
      time: format_date_time(Time.at(data[:time])),
      temp: data[:temperature].round
      })
  end

  private

  def self.format_date_time(date_time)
    date_time.strftime("%l %p").lstrip
  end
end
