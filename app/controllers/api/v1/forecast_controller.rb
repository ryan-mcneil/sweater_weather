class Api::V1::ForecastController < ApplicationController

  def show
    coords = get_coords(params[:location])
    forecast = Forecast.new
    forecast.load_data(coords)
    render json: forecast

  end

  private

  def get_coords(city)
    service = GoogleService.new(city)
    service.get_coords
  end
end
