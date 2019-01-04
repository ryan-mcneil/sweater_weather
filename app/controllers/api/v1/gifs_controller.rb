class Api::V1::GifsController < ApplicationController

  def show
    render json: GifForecastSerializer.new(gif_forecast)
  end

  private

  def gif_forecast
    GifForecast.load_data(coords)
  end
end
