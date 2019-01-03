class Api::V1::ForecastController < ApplicationController

  def show
    coords = get_coords(params[:location])

  end

  private

  def get_coords(city)
    
  end
end
