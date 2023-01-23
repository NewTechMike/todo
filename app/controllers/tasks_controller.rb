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
      render json: { error: task.errors:full_messages}, status: :unprocessable_entity
    end 
  end

  def update
  end

  def destroy
  end
end
