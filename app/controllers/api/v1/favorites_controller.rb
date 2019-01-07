class Api::V1::FavoritesController < ApplicationController

  def index
    user = User.find_by_api_key(params[:api_key])
    if user
      render json: UserFavoritesSerializer.new(user)
    else
      render status: 401
    end
  end

  def create
    user = User.find_by_api_key(params[:api_key])
    if user && params[:api_key] == user.api_key
      user.favorites.find_or_create_by(location: params[:location])
      render status: 201
    else
      render status: 401
    end

  end
end
