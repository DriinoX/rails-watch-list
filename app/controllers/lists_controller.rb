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


  private

  def param_list
    params.require(:list).permit(:name)
  end
end
