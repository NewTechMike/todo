class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: { errors: "Not Authorizied"}, status: :unauthorized
    end 
  end
end
