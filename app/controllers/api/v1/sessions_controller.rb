class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      render json: "An incorrect email or password has been entered"
    end
  end
end
