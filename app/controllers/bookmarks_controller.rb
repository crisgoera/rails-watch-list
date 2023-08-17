class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    redirect_to action: 'index'
  end

  private

  def bookmark_params
    params.required(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end