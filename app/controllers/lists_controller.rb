class ListsController < ApplicationController

  def index
    render json: List.all
  end 

  def show
    if this_list
      render json: this_list
    else 
      render json: {errors: "List not found"}, status: :not_found
    end
  end 

  def create
    list = List.create(list_params)
    if list
      render json: list, status: :created
    else 
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end 

  def update
    if this_list 
      list.update(list_params)
    else
      render json: {errors: list.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    this_list.destroy
    head :no_content
  end 

  private 
  
  def this_list
    return list = List.find_by(id: params[:id])
  end 

  def list_params
    params.permit(:name)
  end

end
