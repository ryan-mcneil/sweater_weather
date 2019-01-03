class Api::V1::ForecastController < ApplicationController

  def show
    coords = get_coords(params[:location])
    render json: coords

  end

  private

  def get_coords(city)
    conn = Faraday.new(url: 'https://maps.googleapis.com')
    response = conn.get("/maps/api/geocode/json?address=#{city}&key=#{ENV['GOOGLE_API_KEY']}")

    location_data = JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end
end
