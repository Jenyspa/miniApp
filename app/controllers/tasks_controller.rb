class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(
    :description))
    @task.save
    reditect_to @task
  end

end
