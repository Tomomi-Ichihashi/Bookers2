class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end
  
  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id 
    if @book.save
      redirect_to book_path(@book.id)
    end
  end
  
  
  
  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
  
end
