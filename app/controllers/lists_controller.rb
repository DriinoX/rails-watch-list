class ListsController < ApplicationController
#GET  /lists
  def index
    @lists = List.all
  end
#GET  /lists/:id
  def show
    @list = List.find(params[:id])
  end
#GET  /lists/new
  def new
    @list = List.new
  end
#POST /lists
  def create
    @list = List.new(param_list)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def param_list
    params.require(:list).permit(:name, :photo)
  end
end
