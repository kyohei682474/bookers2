class BooksController < ApplicationController
  before_action :authenticate_user!
  
     # 投稿データの保存
   def create
       @user = current_user
       @books = Book.all
       @book = Book.new(book_params)
       @book.user_id = current_user.id
    if 
        @book.save
       flash[:success] = "You have created book successfully."
       redirect_to book_path(@book.id)
    else
       render "index"
    end
   end
    
   
  
  
  def index
       @book = Book.new
       @books = Book.all
       @user = current_user
       @users = User.all
      
    
    
  end
  
  def edit
       book = Book.find(params[:id])
    
    unless book.user_id == current_user.id
     redirect_to books_path
    end
     @book = Book.find(params[:id])

    
  end
  
  def show
       @book_new= Book.new
       @book = Book.find(params[:id])
       @user = current_user
  end
  
  def update
      @user =  current_user
      @book = Book.find(params[:id])
   if 
      @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book.id)  
   else
     render:edit
   end
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path   # 投稿一覧画面へリダイレクト  
  end
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
