class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
   
    if @user.save
      redirect_to root_path, notice: "Success registration!" 
    else  
      flash.now[:alert] = "Ne verny parol" 
      render :new  
    end
  end 

  def edit 
    @user = User.find(params[:id]) 
  end 

  def update  
    @user = Uset.find(params[:id]) 

    if @user.update
      redirect_to root_path, notice: "Dannye obnovleny" 
    else  
      flash.now[:alert] = "Ne verny parol" 
      render :edit 
    end
  end
  def destroy 
    @user = Uset.find(params[:id]) 

    @user.destroy 
    session.delete(:user_id)
    redirect_to root_path, notice: "User delete!"
  end

  private 

  def user_params  
    params.require(:user).permit(:name, :nickname, :email)
  end
end 

