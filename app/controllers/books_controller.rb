class BooksController < ApplicationController
  def index
    @books = Book.all
    @new_book = Book.new
  end

  def new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
  end

   if @new_book.save
     flash[:notice] = "The book was successfully created."
     redirect_to book_path(@book)
   else
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
    @book = Book.find(params[:id])

   if @book.update(book_params)
     flash[:notice] = "The book was successfully updated."
     redirect_to book_path(@book)
   else
     render "edit"
   end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "The book was successfully deleted."
      redirect_to books_path
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
