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
    if current_task
      task.update(title: params[:title])
      render json: task, status: :updated
    else 
      render json: { error: "Task not Found" }, status: :not_found
    end 
  end

  def destroy
    if current_task
      title.destroy
      head :no_content
    else 
      render json: { error: "Task not found"}, status: :not_found
    end
  end

  private 

  def current_task
    return task = Task.find_by(title: params[:title])
  end

end
