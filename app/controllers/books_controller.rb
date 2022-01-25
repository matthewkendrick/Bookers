class BooksController < ApplicationController
  def index
  end

  def new
  end

  def create
    @new_book = Book.new(book_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
