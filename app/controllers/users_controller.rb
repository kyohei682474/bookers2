class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      @books = @user.books
      @book = Book.new
      
  end
  
  
  
  def edit
     @user = User.find(params[:id])
  unless @user.id == current_user.id
    redirect_to user_path(current_user.id)
  end
    
  
  end
  

  def update
       
         user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
       @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = "error prohibited this obj from being saved:"
      render 'users/edit'
    end
    
  end
  def index
    @book_new = Book.new
    @user = current_user
    @users = User.all
   
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
  
  
end
