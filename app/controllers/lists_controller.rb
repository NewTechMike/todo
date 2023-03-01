class ListsController < ApplicationController

  def index
    #if current_user
    user = current_user
     # byebug
      render json: List.all
    #else 
     # render json: { errors: "No Lists found" }, status: :not_found
    #end 
  end 

  def show
    if this_list
      render json: this_list
    else 
      render json: { errors: "List not found" }, status: :not_found
    end
  end 

  def create
    list = current_user.lists.create(list_params)
    byebug
    if list
      render json: list, status: :created
    else 
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end 

  def update
    if this_list 
      this_list.update(list_params)
    else
      render json: { errors: this_list.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  def destroy
    this_list.destroy
    head :no_content
  end 

  private 
  
  def this_list
    return list = current_user.lists.find_by(id: params[:id])
  end 

  def list_params
    params.permit(:name)
  end

  def current_user
    return User.find_by(id: session[:user_id])
  end 

end
