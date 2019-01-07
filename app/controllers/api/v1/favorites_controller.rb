class Api::V1::FavoritesController < ApplicationController

  def index
    if user
      render json: UserFavoritesSerializer.new(user)
    else
      render status: 401
    end
  end

  def create
    begin
      user.favorites.find_or_create_by(location: params[:location])
      render status: 201
    rescue
      render status: 401
    end
  end

  def destroy
    begin
      favorite = user.favorites.find_by(location: params[:location])
      favorite.destroy
      render json: UserFavoritesSerializer.new(user)
    rescue
      render status: 401
    end
  end

  private

  def user
    User.find_by_api_key(params[:api_key])
  end

end
