class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      @books = @user.books.all
  end
  
  def edit
    @user = User.find(params[:id])
  if @book.user = current_user
     render "edit"
  else
    redirect_to books_path
  end
  end
  

  def update
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
    @user = current_user
    @users = User.all
   
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
  
end
