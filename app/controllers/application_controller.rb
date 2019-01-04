class ApplicationController < ActionController::API

  private

  def coords
    service = GoogleService.new(params[:location])
    service.get_coords
  end
end
