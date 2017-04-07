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
end
