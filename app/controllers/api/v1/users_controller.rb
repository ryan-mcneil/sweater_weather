class Api::V1::UsersController < ApplicationController

  def create
    if params[:password] == params[:password_confirmation]
      user = User.create(user_params)
      render json: UserSerializer.new(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end