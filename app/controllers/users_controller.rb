class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      @books = @user.books.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)  
    
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
