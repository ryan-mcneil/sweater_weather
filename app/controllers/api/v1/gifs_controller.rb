class Api::V1::GifsController < ApplicationController

  def show
    coords = get_coords(params[:location])
    gif_forecast = GifForecast.load_data(coords)
    render json: []
  end
end
