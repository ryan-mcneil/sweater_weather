class Api::V1::ForecastController < ApplicationController

  def show
    render json: ForecastSerializer.new(forecast)
  end

  private

  def forecast
    Forecast.load_data(coords, params[:location])
  end

end
