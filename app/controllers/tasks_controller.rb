class TasksController < ApplicationController
 
  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    task = Task.create(title: params[:title])
    if task
      render json: task, status: :created
    else
      render json: { error: task.errors:full_messages }, status: :unprocessable_entity
    end 
  end

  def update
    task = Task.find_by(title: params[:title])
    if title
      task.update(title: params[:title])
      render json: task, status: :updated
    else 
      render json: { error: "Task not Found" }, status: :not_found
    end 
  end

  def destroy
  end
end
