class SessionsController < ApplicationController


  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
    else
      render json: { error: "Invalid name or password"}, status: :unauthorized
    end 
  end

end
