class ListsController < ApplicationController

  def index
    render json: List.all
  end 

  def create
    list = List.create(name: params[:name])
    render json: list, status: :created
  end 

  def update
    list = List.find_by(id: params[:id])
    if list 
      list.update(name: params[:name])
    else
      render json: {errors: list.errors.full_messages}, status: :unprocessable_entity
    end 
  end

  def destroy
    list = List.find_by(id: params[:id])
    list.destroy
  end 

end
