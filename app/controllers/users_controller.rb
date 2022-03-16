class UsersController < ApplicationController
   
    
    
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
    redirect_to user_path(current_user)
    end
  end 
  
  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
   flash[:notice] = "You have updated user successfully"
   redirect_to user_path(current_user)
   else
    render :edit
   end 
  end 
  
  
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end 
  
  
  
    
  private
  def user_params
     params.require(:user).permit(:profile_image,:name,:introduction)
  end 
   
  
end


