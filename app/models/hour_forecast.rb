class HourForecast

  def initialize(args)
    @time = args[:time]
    @temp = args[:temp]
  end

  def self.read(data)
    HourForecast.new({
      time: Time.at(data[:time]),
      temp: data[:temperature].round
      })
  end
end
