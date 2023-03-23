class TasksController < ApplicationController
  skip_before_action :authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    tasks = this_list.tasks.all
    render json: tasks.order("created_at DESC")
  end

  def create
    task = this_list.tasks.create(title: params[:title], done: false)
    if task
      render json: task, status: :created
    else
      render json: { error: task.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  def update
    if current_task
      current_task.update(task_params)
      render json: task, status: :updated
    else 
      render json: { error: "Task not Found" }, status: :not_found
    end 
  end

  def destroy
    if current_task
      current_task.destroy
      head :no_content, status: :deleted
    else 
      render json: { error: "Task not found" }, status: :not_found
    end
  end

  private 

  def current_task
    return task = this_list.tasks.find_by(title: params[:title])
  end

  def task_params
    params.permit(:title, :done)
  end

  def render_not_found_response
    return render json: { error: "Task not Found" }, status: :not_found
  end

  def current_user
    user = User.find_by(id: session[:user_id])
    #byebug
  end 

  def this_list
    user = current_user
    #byebug
    return list = current_user.lists.find_by(id: params[:id])
  end 


end
