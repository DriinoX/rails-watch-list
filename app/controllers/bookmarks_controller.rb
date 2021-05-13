class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @bookmark.list = @list
  end

  def create
    @bookmark = Bookmark.new(params_bookmark)
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy

  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment)
  end
end
