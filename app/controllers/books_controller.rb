class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  # params = { "book" => { title" => "aaaa", "body" => "hogege" }
  
  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id 
    
    if @book.save
      flash[:notice1] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index'
    end
    
  end
  
  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    
    if @book.user == current_user
      render 'edit'
    else
      redirect_to books_path
    end
    
  end
  
  def update
    @book = Book.find(params[:id])
    
    if@book.update(book_params)
      flash[:notice1] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'edit'
    end
    
  end  
  
 
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end
