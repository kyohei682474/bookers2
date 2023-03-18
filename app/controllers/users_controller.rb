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
    if user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = "更新に失敗しました。"
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
