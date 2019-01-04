class ApplicationController < ActionController::API

  private

  def get_coords(city)
    service = GoogleService.new(city)
    service.get_coords
  end
end
