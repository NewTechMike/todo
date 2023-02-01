class TasksController < ApplicationController
 before_action :authorize
 
  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    task = Task.create(task_params)
    if task
      render json: task, status: :created
    else
      render json: { error: task.errors:full_messages }, status: :unprocessable_entity
    end 
  end

  def update
    if current_task
      task.update(task_params)
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

  def task_params
    params.permit(:title)
  end

end
