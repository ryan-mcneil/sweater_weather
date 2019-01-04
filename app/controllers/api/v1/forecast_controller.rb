class Api::V1::ForecastController < ApplicationController

  def show
    coords = get_coords(params[:location])
    forecast = Forecast.load_data(coords, params[:location])
    render json: ForecastSerializer.new(forecast)

  end

end
