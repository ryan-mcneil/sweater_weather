class Api::V1::UsersController < ApplicationController



  def create
    if params[:password] == params[:password_confirmation]
      user = User.new(user_params)
      binding.pry
      if user.save

      end

    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
