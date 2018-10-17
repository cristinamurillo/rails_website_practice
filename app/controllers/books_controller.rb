class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    author = Author.find(params[:book][:authors])
    @book.authors << author

    redirect_to @book 
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to books_path
  end

  # private
  #
  # def book_params
  #   params.require(:book).permit(:title, :pages)
  # end
end
