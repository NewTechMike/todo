class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: { errors: "Not Authorizied"}, status: :unauthorized
    end 
  end

  def create
    user = User.create!(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if user 
      session[:user_id] = user.id
      render json: user, status: :created
    else 
      render jsons: { errors: user.errors.full_message }, status: :unprocessable_entity
    end 
  end
end
