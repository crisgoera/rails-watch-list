class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    @list = List.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new, status: :unprocesable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.required(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
