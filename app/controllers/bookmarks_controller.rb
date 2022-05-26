class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = List.movies.find(params[:movie_id])
    @list = List.find(params[:list_id])
    @bookmark.movie = @movie
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render "lists/show"
    end
  end

  def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
      redirect_to '/lists/show', :notice => "Your bookmark has been deleted"
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end
end
