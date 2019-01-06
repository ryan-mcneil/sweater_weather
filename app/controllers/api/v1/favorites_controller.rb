class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by_api_key(params[:api_key])

    render json:
  end

  def create
    user = User.find_by_api_key(params[:api_key])
    if user && params[:api_key] == user.api_key
      user.favorites.create(location: params[:location])
    else
      # render 401
    end

  end

  private

  # def current_weather
  #   CurrentWeather.load_data(coords, params[:location])
  # end
end
