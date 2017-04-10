class ListsController < ApplicationController

  def new
    @list = List.new
    10.times {@list.tasks.build}
  end

  def create
    @list = List.new(params.require(:list).permit(
    :name, :privacy, tasks_attributes: [:description]))
    @list.save
    redirect_to @list
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update!(params.require(:list).permit(
    :name, :privacy, tasks_attributes: [:description]))
    redirect_to @list
  end

  def destroy
    @list = List.task.find(params[:id])
    @list.task.destroy
    redirect_to @list
    flash[:alert] = "Tarefa deletada"
  end
end
