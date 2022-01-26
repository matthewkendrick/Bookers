class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :desc)
    @new_book = Book.new
  end

  def new
  end

  def create
    @new_book = Book.new(book_params)

   if @new_book.save
     flash[:notice] = "Book was successfully created"
     redirect_to book_path(@new_book)
   else
     @books = Book.all.order(created_at: :desc)
     @book = Book.find_by(id:params[:id])
     render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
