class UsersController < ApplicationController

  def index
    render json: User.all
  end 

  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: user
    else
      render json: { errors: "Not Authorizied"}, status: :unauthorized
    end 
  end

  def create
    user = User.create!(user_params)
    if user 
      session[:user_id] = user.id
      render json: user, status: :created
    else 
      render jsons: { errors: user.errors.full_message }, status: :unprocessable_entity
    end 
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end 
end
