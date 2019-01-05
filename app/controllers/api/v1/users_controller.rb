class Api::V1::UsersController < ApplicationController

  def create
    if correct_password?
      user = User.create(user_params)
      render json: UserSerializer.new(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end

  def correct_password?
    params[:password] == params[:password_confirmation]
  end
end
