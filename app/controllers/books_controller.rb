class BooksController < ApplicationController
    
    
     # 投稿データの保存
  def create
    
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
    
    
    
  end
  
  def edit
    @book = Book.find(params[:id])
    
     
  end
  def show
    @book_new= Book.new
    @book = Book.find(params[:id])
    
     
  end

  def destroy
  end
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
