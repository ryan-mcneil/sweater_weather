class Api::V1::ForecastController < ApplicationController

  def show
    coords = get_coords(params[:location])
    render json: coords

  end

  private

  def get_coords(city)
    service = GoogleService.new(city)
    service.get_coords
  end
end
