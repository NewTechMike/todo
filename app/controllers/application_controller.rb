class ApplicationController < ActionController::API
  include ActionController::Cookies

  def hello_world
    session[:count] = (session[:count] || 0) + 1
    render json: { count: session[:count]}
  end

  def authorize 
    render json: { error: "Not Authorized" }, status: :unauthorized unless session.include? :user_id
  end 

  def current_user
    User.find_by(id: session[:user_id])
  end 
end
