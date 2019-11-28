class BooksController < ApplicationController
  def index
  	@book = Book.new
  	@books = Book.all
  end

  def create
    book = Book.new(book_params)
    if book.save
       flash[:notice] = "Book was successfully create."
       redirect_to book_path(book)
    else
       redirect_to books_path
    end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  	  flash[:notice] = "Book was successfully update."
  	  redirect_to book_path(book)
  	else redirect_to edit_book_path(book)
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end