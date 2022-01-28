class BooksController < ApplicationController
  # 投稿一覧の表示
  def index
    @books = Book.all
    @book = Book.new
  end

  # 新規投稿
  def create
    @books = Book.all
    @book = Book.new(book_params)

    # バリデーションチェック
    if @book.save
      flash[:notice] = "The book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  # 詳細画面の表示
  def show
    @book = Book.find(params[:id])
  end

  # 編集画面の表示
  def edit
    @book = Book.find(params[:id])
  end

  # 編集の反映
  def update
    @book = Book.find(params[:id])

    # バリデーションチェック
    if @book.update(book_params)
      flash[:notice] = "The book was successfully updated."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :edit
    end
  end

  # 投稿削除
  def destroy
    @book = Book.find(params[:id])

    # バリデーションチェック
    if @book.destroy
      flash[:notice] = "The book was successfully deleted."
      redirect_to books_path
    else
      render :index
    end
  end

  # ストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end