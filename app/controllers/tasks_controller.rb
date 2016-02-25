class TasksController < ApplicationController
  before_action :set_tasks, only: [:index, :create, :update]
  before_action :set_task, only: [:edit, :update]
  def index
  end

  def new
  end

  def create
    Task.create(task_params)
  end

  def edit
  end

  def update
    @task.update(task_params)
  end

  private
  def task_params
    params.require(:task).permit(:title, :detail, :deadline, :category)
  end

  def set_tasks
    @tasks = Task.includes(:users).all
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
