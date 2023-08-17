class ListsController < ApplicationController
  # Read all
  def index
    @lists = List.all
  end

  # Create new
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to action: 'index'
  end

  def show
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete
    redirect_to action: 'index'
  end

  private

  def list_params
    params.require(:list).permit(:name, :id)
  end
end
