class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @book = Book.new
    @books = Book.all
    @user= current_user
  end
  
  def show
  end

  def edit
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path
  end
  
  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
  
end
